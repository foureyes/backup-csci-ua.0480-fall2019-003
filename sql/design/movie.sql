--select distinct release_country from staging.movie;

--get num characters of largest country string
--select max(char_length(release_country)) from staging.movie;

create table country (
  country_id serial,
  name varchar(50) not null,
  primary key(country_id)
);

insert into country (name)
    (select distinct release_country from staging.movie);

-- do countries match?
select count(*) from country;
select distinct release_country from staging.movie;

--select distinct filming_locations from staging.movie;
create table filming_location (
  filming_location_id serial,
  name varchar(255),
  country_id integer references country(country_id),
  primary key(filming_location_id)
);


-- separate into city and generic location
--select loc, array_length(loc, 1), loc[array_length(loc, 1)] from
--  (select regexp_split_to_array(filming_locations, ',') as loc from staging.movie limit 10) as location;


-- join with country to get id
--select array_to_string(loc[1:array_length(loc, 1) - 1], ',') as location,
--       trim(loc[array_length(loc, 1)]) as country_name,
--       country.country_id
--from
--     (select regexp_split_to_array(filming_locations, ',') as loc from staging.movie limit 10) as location
--inner join country
--on country.name = trim(loc[array_length(loc, 1)]);

insert into filming_location (name, country_id)
    (select
         distinct array_to_string(loc[1:array_length(loc, 1) - 1], ',') as location,country.country_id
     from
      (select regexp_split_to_array(filming_locations, ',') as loc from staging.movie) as location
    inner join country
    on country.name = trim(loc[array_length(loc, 1)]));

select
         distinct array_to_string(loc[1:array_length(loc, 1) - 1], ',') as location,country.country_id
     from
      (select regexp_split_to_array(filming_locations, ',') as loc from staging.movie) as location
    inner join country
    on country.name = trim(loc[array_length(loc, 1)]);


select count(*) from filming_location;
select filming_locations, count(*) from staging.movie where filming_locations is not null group by filming_locations;
--delete from filming_location;
select * from filming_location;
select count(*) from filming_location;
select name, count(*) from filming_location group by name;
select filming_location.name, country.name
from filming_location
inner join country
    on country.country_id = filming_location.country_id;



insert into person (given, surname)
select trim(array_to_string(parts[1:array_length(parts, 1) - 1], ' ')) as given, trim(parts[array_length(parts, 1)]) as surname
from (select regexp_split_to_array(full_name, ' ') as parts
   from (select distinct regexp_split_to_table(movie_cast, E'\\|') as full_name from staging.movie) as person) as name_parts;
select * from person;

select distinct regexp_split_to_table(movie_cast, E'\\|') as full_name from staging.movie;
select * from genre;
--select max(char_length(movie_cast)) from  staging.movie;
create table person (
  person_id serial,
  given varchar(255),
  surname varchar(255),
  primary key(person_id)
);


--select max(char_length(genres)) from staging.movie;
insert into genre (name)
    (select distinct regexp_split_to_table(genres, E'\\|') as genre from staging.movie);
create table genre (
  genre_id serial,
  name varchar(80),
  primary key(genre_id)
);
select * from genre;

insert into movie
    (title, mpaa_rating,imdb_rating, runtime, language, budget)
select
       title as title,
       movie_rating as mpaa_rating,
       review_rating as imdb_rating,
       substring(movie_run_time, E'\\d+')::smallint as runtime,
       language,
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

alter table movie add column title text;
alter table movie rename column release_data TO release_date;

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