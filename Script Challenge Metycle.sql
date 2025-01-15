create table titles (
    id VARCHAR primary KEY,
    title TEXT,
    type VARCHAR,
    description TEXT,
    release_year INT,
    age_certification VARCHAR,
    runtime INT,
    genres TEXT,
    production_countries TEXT,
    seasons INT,
    imdb_id VARCHAR,
    imdb_score NUMERIC,
    imdb_votes INT,
    tmdb_popularity NUMERIC,
    tmdb_score NUMERIC
);

create table ratings (
    id VARCHAR primary key,
    title TEXT,
    type VARCHAR,
    description TEXT,
    release_year INT,
    age_certification VARCHAR,
    runtime INT,
    imdb_id VARCHAR,
    imdb_score NUMERIC,
    imdb_votes INT
);

create table credits (
    person_id VARCHAR,
    id VARCHAR,
    name VARCHAR,
    character VARCHAR,
    role VARCHAR,
    primary key (person_id, id, role)
);

select * from titles limit 20;
select * from ratings limit 20;
select * from credits limit 20;

drop table if exists titles;
drop table if exists ratings;
drop table if exists credits;


--Ex. 2

create table combined_titles as
select distinct
	t.id, t.title, t.type, t.description, t.release_year,
	t.age_certification, t.runtime, t.genres, t.production_countries,
	t.imdb_id, t.imdb_score, t.imdb_votes, t.tmdb_popularity, t.tmdb_score
from titles t
left join ratings r on t.id = r.id;


select * from combined_titles;

--Ex. 3

select title, runtime
from combined_titles
where type = 'MOVIE'
order by runtime desc;

select title, runtime
from combined_titles
where type  = 'MOVIE'
order by runtime asc;


select release_year, type, AVG(runtime) as avg_runtime
from combined_titles
group by release_year, type
order by release_year;


select title, runtime
from combined_titles
order by runtime desc 
limit 10;

select title, runtime
from combined_titles
order by runtime asc 
limit 10;


select title, LENGTH(title) as title_lenght
from combined_titles
order by title_lenght desc
limit 10;

select title, LENGTH(title) as title_lenght
from combined_titles
order by title_lenght asc 
limit 10;



select
	case
		when imdb_votes between 0 and 1000 then '0-1000'
		when imdb_votes between 1001 and 5000 then '1001-5000'
		when imdb_votes between 5001 and 10000 then '5001-10000'
		else '>10000'
	end as vote_range,
	count(*) as num_movies,
	AVG(imdb_score) as avg_score
from combined_titles
where type = 'MOVIE'
group by vote_range 
order by vote_range;


select genres, count(*) as num_movies
from combined_titles
group by genres
order by num_movies desc;


--Ex. 4

create table combined_titles_with_credits as
select
	t.*,
	c.person_id,
	c.name as actor_name,
	c.character,
	c.role
from combined_titles t
left join credits c on t.id = c.id;


select
    release_year, 
    actor_name, 
    COUNT(*) AS num_movies
from combined_titles_with_credits
where role = 'ACTOR'
group by release_year, actor_name
order by  num_movies desc;


select 
    release_year, 
    actor_name, 
    COUNT(*) AS num_movies
from combined_titles_with_credits
where role = 'ACTOR'
group by release_year, actor_name
order by num_movies desc 
LIMIT 1;
	



	
