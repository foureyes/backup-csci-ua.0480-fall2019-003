create table country (
  country_id serial,
  name varchar(50) not null,
  primary key(country_id)
);

create table filming_location (
  filming_location_id serial,
  name varchar(255) not null,
  country_id integer references country(country_id) on delete restrict not null,
  primary key(filming_location_id)
);

create table person (
  person_id serial,
  given varchar(255),
  surname varchar(255),
  unique (given, surname),
  primary key(person_id)
);

create table genre (
  genre_id serial,
  name varchar(80),
  primary key(genre_id)
);

create table language (
  genre_id serial,
  name varchar(80) not null,
  primary key(genre_id)
);

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

create table movie_genre (
  movie_id integer references movie(movie_id),
  genre_id integer references genre(genre_id)
);

create table movie_director (
  movie_id integer references movie(movie_id) not null,
  person_id integer references person(person_id) not null
);

create table movie_actor (
  movie_id integer references movie(movie_id) not null,
  person_id integer references person(person_id) not null
);
