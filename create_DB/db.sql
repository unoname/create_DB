
CREATE DATABASE db_films;


CREATE TABLE person (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL		
);


CREATE TABLE film (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  release_date DATE, 
  country_production VARCHAR(255) NOT NULL,
  slogan TEXT,
  budget NUMERIC,
  marketing NUMERIC,
  us_gross NUMERIC,
  worldwide_gross NUMERIC,
  russia_premiere DATE,
  worldwide_premiere DATE,
  dvd_release DATE,
  age_rating VARCHAR(10),
  rating NUMERIC,
  duration INTEGER,
	description TEXT,
  audio_track VARCHAR(255),
  subtitles VARCHAR(255),
  video_quality VARCHAR(10)
);


CREATE TABLE genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);


CREATE TABLE viewers (
    id SERIAL PRIMARY KEY,
    film_id INTEGER REFERENCES film(id),
    country VARCHAR(255),
    viewers_count INTEGER
);



CREATE TABLE film_genre (
    film_id INTEGER REFERENCES film(id),
    genre_id INTEGER REFERENCES genre(id),
    PRIMARY KEY(film_id, genre_id)
);


CREATE TABLE film_viewers (
    film_id INTEGER REFERENCES film(id),
    viewers_id INTEGER REFERENCES viewers(id),
    PRIMARY KEY(film_id, viewers_id)
);


CREATE TABLE film_person (
    film_id INTEGER REFERENCES film(id),
    person_id INTEGER REFERENCES person(id),
    role VARCHAR(255),
    PRIMARY KEY(film_id, person_id, role)
);

