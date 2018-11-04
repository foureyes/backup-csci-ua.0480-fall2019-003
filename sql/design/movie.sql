--select distinct release_country from staging.movie;

-----------------------------------------------------
-- country
-----------------------------------------------------
-- 1. get num characters of largest country string
select max(char_length(release_country)) from staging.movie;

-- 2. create country table
create table country (
  country_id serial,
  name varchar(50) not null,
  primary key(country_id)
);

-- 3. populate country table using staging data
-- use subquery to do this:
-- INSERT INTO table_name ( column_name [, ...] )
--    query
--  see:
--  https://www.postgresql.org/docs/current/static/sql-insert.html
insert into country (name)
    (select distinct release_country from staging.movie);

-- 4. examine a few countries
select * from country limit 15;

-- 5. do number of countries match?
select
       (select count(*) from country) =
       (select count(distinct release_country) from staging.movie)
        as counts_match;

-----------------------------------------------------
-- filming_location
-----------------------------------------------------
-- 1. check out the filming locations from staging
select distinct filming_locations from staging.movie;

-- 2. create a filming_location table
create table filming_location (
  filming_location_id serial,
  name varchar(255) not null,
  -- immediately raise an error if an attempt to delete the referenced
  -- country is made
  country_id integer references country(country_id) on delete restrict not null,
  primary key(filming_location_id)
);

-- 3. try breaking up filming location:
-- use a subquery to split filming_locations into an array
-- ... display the entire array, its length, and the last element
select loc, array_length(loc, 1), loc[array_length(loc, 1)] from
  (select regexp_split_to_array(filming_locations, ',') as loc from staging.movie limit 10) as location;

-- 4. now that we know we can break it up, let's see if we can get the
-- the last part as the country, and everything before it as a "location"
select  array_to_string(loc[1:array_length(loc, 1)-1], ',') as loc_name,
    loc[array_length(loc, 1)] as country_name from
  (select regexp_split_to_array(filming_locations, ',') as loc from staging.movie) as loc;

-- 5. use a common table expression (CTE) / SELECT in WITH ... to save
-- the previous query as a one-time use "temporary table"
-- trim the values to remove white space surrounding string
with loc_temp as (
    select  trim(array_to_string(loc[1:array_length(loc, 1)-1], ',')) as loc_name,
            trim(loc[array_length(loc, 1)]) as country_name
    from
         (select regexp_split_to_array(filming_locations, ',') as loc
          from staging.movie) as loc
)
select distinct country_name, country.country_id, country.name
from loc_temp left join country on country.name = loc_temp.country_name
;

-- 6. fill in any additional countries that need to be added using cte
-- and left outer join (this will show us all locations that don't have
-- a corresponding country in the country table... we'll exclude places
-- that are not title case
with loc_temp as (
    select  trim(array_to_string(loc[1:array_length(loc, 1)-1], ',')) as loc_name,
            trim(loc[array_length(loc, 1)]) as country_name
    from
         (select regexp_split_to_array(filming_locations, ',') as loc
          from staging.movie) as loc
)
insert into country (name)
select distinct country_name
from loc_temp left outer join country on country.name = loc_temp.country_name
where country_id is null
and country_name is not null
and initcap(country_name) = country_name;

-- 7. finally insert locations
with loc_temp as (
    select  trim(array_to_string(loc[1:array_length(loc, 1)-1], ',')) as loc_name,
            trim(loc[array_length(loc, 1)]) as country_name
    from
         (select regexp_split_to_array(filming_locations, ',') as loc
          from staging.movie) as loc
)
insert into filming_location (name, country_id)
select distinct loc_name, country_id
from loc_temp inner join country on country.name = loc_temp.country_name;

-- 8. run checks to see results; we can see that there's a difference
-- in counts due to some locations not being added (spacing, last
-- element not title case, etc.)
select * from filming_location;
select count(*) from filming_location;
select count(distinct filming_locations) from staging.movie;

select filming_location.name, country.name
from filming_location
inner join country
    on country.country_id = filming_location.country_id;

-----------------------------------------------------
-- person (from actors)
-----------------------------------------------------
-- 1. create a person table
-- what's the longest possible name?
select max(char_length(movie_cast)) from  staging.movie;

create table person (
  person_id serial,
  given varchar(255),
  surname varchar(255),
  unique (given, surname),
  primary key(person_id)
);
drop function parse_name(varchar);

-- 2. create a parse name function...
create or replace function parse_name(
    s varchar
  )
  returns varchar[] as $$
declare
  result varchar[];
begin
  select
         array[trim(array_to_string(parts[1:array_length(parts, 1) - 1], ' '))::varchar,
         trim(parts[array_length(parts, 1)])::varchar]
  into result
  from (select string_to_array(s, ' ') as parts) as name_parts;
  return result;
end;
$$ language 'plpgsql';
select * from staging.movie;
select parse_name('Ray Lovelock');
select parse_name('Anna Maria Rizzoli');


-- 3. insert into person table ...
insert into person (given, surname)
select parts[1] as given, parts[2] as surname
-- split actor name into last name (part after comma) and given name
from (select parse_name(full_name) as parts
  -- split cast field into individual actors' names
  -- note that we're assuming that actors with the same name are the same person
  -- the data set does not offer anyway of differentiating between people with the
  -- same name, sooo for the sake of having a separate person table, we'll assume
  -- (this is a bad assumption, of course), that actors with the same name are the
  -- same person
  from (select distinct regexp_split_to_table(movie_cast, E'\\|') as full_name from staging.movie) as person) as name_parts;
-- 3. run some checks; these two selects should be the same!
select count(*) from person;
select count(distinct full_name)
from (select regexp_split_to_table(movie_cast, E'\\|') as full_name from staging.movie) as actors;

-- want people from director's too? here's a start: extract director names from
-- from (select regexp_split_to_array(full_name, ' ') as parts




create or replace function extract_director_names(
  s text
)
returns table(name text) as $$
begin
  return query select distinct regexp_split_to_table(substring(s, E'Directed by ([^With]*)\. With'), ',');
end;
$$ language 'plpgsql';
select extract_director_names('Directed by Joe V,Foo Bar. With Baz Qux. A Test!');

-- let's see if we can get all the directors's names parsed
select parts[1], parts[2]
-- break up each name into parts
from (select parse_name(director_name) as parts
      -- regexp out and isolate each director name in plot
     from (select distinct extract_director_names(plot) as director_name from staging.movie)
           as director_names)
      as directors_name_parts;

-- which directors already appear as actors?
select parts[1], parts[2]
from (select parse_name(director_name) as parts
     from (select distinct extract_director_names(plot) as director_name from staging.movie)
           as director_names)
      as directors_name_parts
inner join person on parts[1] = person.given and parts[2] = person.surname;

-- finally, insert or no action into person using on conflict to do nothing
insert into person (given, surname)
select parts[1] as given, parts[2] as surname
from (select parse_name(director_name) as parts
     from (select distinct extract_director_names(plot) as director_name from staging.movie)
           as director_names)
      as directors_name_parts
on conflict (given, surname) do nothing;

-----------------------------------------------------
-- genre
-----------------------------------------------------
-- 1. create genre table!
select max(char_length(genres)) from staging.movie;

create table genre (
  genre_id serial,
  name varchar(80),
  primary key(genre_id)
);
-- 2. insert genres
insert into genre (name)
    (select distinct regexp_split_to_table(genres, E'\\|') as genre from staging.movie);

select * from genre;

-----------------------------------------------------
-- language
-----------------------------------------------------
-- 1. create language table!
select max(char_length(language)) from staging.movie;

create table language (
  genre_id serial,
  name varchar(80) not null,
  primary key(genre_id)
);
-- 2. insert languages
insert into language (name)
    (select distinct regexp_split_to_table(language, E'\\|') as name from staging.movie);

select * from language;

-----------------------------------------------------
-- movie
-----------------------------------------------------
--select max(char_length(movie_rating)) from staging.movie;
create table movie (
  movie_id serial,
  title text,
  release_date date,
  release_country integer references country(country_id),
  mpaa_rating varchar(20),
  imdb_rating numeric,
  runtime smallint,
  plot text,
  language varchar(255),
  budget money,
  primary key (movie_id)
);

insert into movie
    (movie_id, title, mpaa_rating, imdb_rating, plot, runtime, budget)
select
       movie_id,
       title as title,
       movie_rating as mpaa_rating,
       review_rating as imdb_rating,
       plot,
       substring(movie_run_time, E'\\d+')::smallint as runtime,
       case
         when budget like '$%' then cast(budget as money)
         else null
       end as budget
from staging.movie;

select * from movie;

--select movie.title, movie.movie_id, genre_name, genre_id from
insert into movie_genre (movie_id, genre_id)
select movie.movie_id,genre_id from
(select title, regexp_split_to_table(genres, E'\\|') as genre_name from staging.movie) as title_genre
    inner join genre
    on genre.name = genre_name
    inner join movie
    on movie.title = title_genre.title;
select * from movie_genre;

select country.name, count(movie_id) from movie
  inner join country
  on release_country = country.country_id
  group by country.name;

select distinct release_country from movie;

select title, genre.name from movie
  inner join movie_genre
  on movie.movie_id = movie_genre.movie_id
  inner join genre
  on genre.genre_id = movie_genre.genre_id;


update movie set release_country = country.country_id
from staging.movie
inner join country
    on country.name = staging.movie.release_country;
    where trim(movie.title) = trim(staging.movie.title);

select title, country.name, country_id from staging.movie
inner join country
    on trim(country.name) ilike staging.movie.release_country;

update movie set release_country = country.country_id
from
(select title, country.name, country_id from staging.movie
inner join country
    on trim(country.name) ilike staging.movie.release_country) as country_temp;




create table movie_genre (
  movie_id integer references movie(movie_id),
  genre_id integer references genre(genre_id)
);

create table movie_director (
  movie_id integer references movie(movie_id),
  person_id integer references person(person_id)
);

create table movie_actor (
  movie_id integer references movie(movie_id),
  person_id integer references person(person_id)
);