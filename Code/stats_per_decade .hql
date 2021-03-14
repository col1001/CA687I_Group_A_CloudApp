/* HiveQL queries used to create stats per decade table and for data exploration */

CREATE TABLE IF NOT EXISTS stats_all (acousticness float, artists string, danceability float,
				      duration_s float, energy float, explicit int,
				      instrumentalness float, key int,
				      liveness float, loudness int, mode int,
				      name string, popularity float, speechiness float,
				      tempo int, valence float, year int)
				      ROW FORMAT DELIMITED FIELDS TERMINATED BY '|';

LOAD DATA LOCAL INPATH '/home/colhan/cleaned_and_pruned_ch.csv' OVERWRITE INTO TABLE stats_all;

DROP TABLE stats_per_decade;

CREATE TABLE IF NOT EXISTS stats_per_decade (avg_acousticness float, avg_danceability float, avg_duration_s float,
					     avg_energy float, num_explicit int, num_non_explicit int,
					     avg_instrumentalness float, avg_key int, avg_liveness float,
					     avg_loudness int, num_major int, num_minor int, avg_popularity float,
					     avg_speechiness float, avg_tempo int, avg_valence float, num_songs int, decade int);

INSERT INTO stats_per_decade SELECT ROUND(AVG(acousticness),2), ROUND(AVG(danceability),2), ROUND(AVG(duration_s),2),
				    ROUND(AVG(energy),2), COUNT(CASE explicit when 1 then 1 end),
				    COUNT(CASE explicit when 0 then 0 end), ROUND(AVG(instrumentalness),2),
				    ROUND(AVG(KEY),2), ROUND(AVG(liveness),2), ROUND(AVG(loudness),2), COUNT(CASE mode when 1 then 1 end),
				    COUNT(CASE mode when 0 then 0 end), ROUND(AVG(popularity),2),
				    ROUND(AVG(speechiness),2), ROUND(AVG(tempo),2), ROUND(AVG(valence),2), COUNT(name), 0
				    FROM stats_all;

INSERT INTO stats_per_decade SELECT ROUND(AVG(acousticness),2), ROUND(AVG(danceability),2), ROUND(AVG(duration_s),2),
				    ROUND(AVG(energy),2), COUNT(CASE explicit when 1 then 1 end),
				    COUNT(CASE explicit when 0 then 0 end), ROUND(AVG(instrumentalness),2),
				    ROUND(AVG(KEY),2), ROUND(AVG(liveness),2), ROUND(AVG(loudness),2), COUNT(CASE mode when 1 then 1 end),
				    COUNT(CASE mode when 0 then 0 end), ROUND(AVG(popularity),2),
				    ROUND(AVG(speechiness),2), ROUND(AVG(tempo),2), ROUND(AVG(valence),2), COUNT(name), 1920
				    FROM stats_all WHERE year >= 1920 AND year < 1930;

INSERT INTO stats_per_decade SELECT ROUND(AVG(acousticness),2), ROUND(AVG(danceability),2), ROUND(AVG(duration_s),2),
				    ROUND(AVG(energy),2), COUNT(CASE explicit when 1 then 1 end),
				    COUNT(CASE explicit when 0 then 0 end), ROUND(AVG(instrumentalness),2),
				    ROUND(AVG(KEY),2), ROUND(AVG(liveness),2), ROUND(AVG(loudness),2), COUNT(CASE mode when 1 then 1 end),
				    COUNT(CASE mode when 0 then 0 end), ROUND(AVG(popularity),2),
				    ROUND(AVG(speechiness),2), ROUND(AVG(tempo),2), ROUND(AVG(valence),2), COUNT(name), 1930
				    FROM stats_all WHERE year >= 1930 AND year < 1940;



INSERT INTO stats_per_decade SELECT ROUND(AVG(acousticness),2), ROUND(AVG(danceability),2), ROUND(AVG(duration_s),2),
				    ROUND(AVG(energy),2), COUNT(CASE explicit when 1 then 1 end),
				    COUNT(CASE explicit when 0 then 0 end), ROUND(AVG(instrumentalness),2),
				    ROUND(AVG(KEY),2), ROUND(AVG(liveness),2), ROUND(AVG(loudness),2), COUNT(CASE mode when 1 then 1 end),
				    COUNT(CASE mode when 0 then 0 end), ROUND(AVG(popularity),2),
				    ROUND(AVG(speechiness),2), ROUND(AVG(tempo),2), ROUND(AVG(valence),2), COUNT(name), 1940
				    FROM stats_all WHERE year >= 1940 AND year < 1950;



INSERT INTO stats_per_decade SELECT ROUND(AVG(acousticness),2), ROUND(AVG(danceability),2), ROUND(AVG(duration_s),2),
				    ROUND(AVG(energy),2), COUNT(CASE explicit when 1 then 1 end),
				    COUNT(CASE explicit when 0 then 0 end), ROUND(AVG(instrumentalness),2),
				    ROUND(AVG(KEY),2), ROUND(AVG(liveness),2), ROUND(AVG(loudness),2), COUNT(CASE mode when 1 then 1 end),
				    COUNT(CASE mode when 0 then 0 end), ROUND(AVG(popularity),2),
				    ROUND(AVG(speechiness),2), ROUND(AVG(tempo),2), ROUND(AVG(valence),2), COUNT(name), 1950
				    FROM stats_all WHERE year >= 1950 AND year < 1960;



INSERT INTO stats_per_decade SELECT ROUND(AVG(acousticness),2), ROUND(AVG(danceability),2), ROUND(AVG(duration_s),2),
				    ROUND(AVG(energy),2), COUNT(CASE explicit when 1 then 1 end),
				    COUNT(CASE explicit when 0 then 0 end), ROUND(AVG(instrumentalness),2),
				    ROUND(AVG(KEY),2), ROUND(AVG(liveness),2), ROUND(AVG(loudness),2), COUNT(CASE mode when 1 then 1 end),
				    COUNT(CASE mode when 0 then 0 end), ROUND(AVG(popularity),2),
				    ROUND(AVG(speechiness),2), ROUND(AVG(tempo),2), ROUND(AVG(valence),2), COUNT(name), 1960
				    FROM stats_all WHERE year >= 1960 AND year < 1970;



INSERT INTO stats_per_decade SELECT ROUND(AVG(acousticness),2), ROUND(AVG(danceability),2), ROUND(AVG(duration_s),2),
				    ROUND(AVG(energy),2), COUNT(CASE explicit when 1 then 1 end),
				    COUNT(CASE explicit when 0 then 0 end), ROUND(AVG(instrumentalness),2),
				    ROUND(AVG(KEY),2), ROUND(AVG(liveness),2), ROUND(AVG(loudness),2), COUNT(CASE mode when 1 then 1 end),
				    COUNT(CASE mode when 0 then 0 end), ROUND(AVG(popularity),2),
				    ROUND(AVG(speechiness),2), ROUND(AVG(tempo),2), ROUND(AVG(valence),2), COUNT(name), 1970
				    FROM stats_all WHERE year >= 1970 AND year < 1980;



INSERT INTO stats_per_decade SELECT ROUND(AVG(acousticness),2), ROUND(AVG(danceability),2), ROUND(AVG(duration_s),2),
				    ROUND(AVG(energy),2), COUNT(CASE explicit when 1 then 1 end),
				    COUNT(CASE explicit when 0 then 0 end), ROUND(AVG(instrumentalness),2),
				    ROUND(AVG(KEY),2), ROUND(AVG(liveness),2), ROUND(AVG(loudness),2), COUNT(CASE mode when 1 then 1 end),
				    COUNT(CASE mode when 0 then 0 end), ROUND(AVG(popularity),2),
				    ROUND(AVG(speechiness),2), ROUND(AVG(tempo),2), ROUND(AVG(valence),2), COUNT(name), 1980
				    FROM stats_all WHERE year >= 1980 AND year < 1990;



INSERT INTO stats_per_decade SELECT ROUND(AVG(acousticness),2), ROUND(AVG(danceability),2), ROUND(AVG(duration_s),2),
				    ROUND(AVG(energy),2), COUNT(CASE explicit when 1 then 1 end),
				    COUNT(CASE explicit when 0 then 0 end), ROUND(AVG(instrumentalness),2),
				    ROUND(AVG(KEY),2), ROUND(AVG(liveness),2), ROUND(AVG(loudness),2), COUNT(CASE mode when 1 then 1 end),
				    COUNT(CASE mode when 0 then 0 end), ROUND(AVG(popularity),2),
				    ROUND(AVG(speechiness),2), ROUND(AVG(tempo),2), ROUND(AVG(valence),2), COUNT(name), 1990
				    FROM stats_all WHERE year >= 1990 AND year < 2000;



INSERT INTO stats_per_decade SELECT ROUND(AVG(acousticness),2), ROUND(AVG(danceability),2), ROUND(AVG(duration_s),2),
				    ROUND(AVG(energy),2), COUNT(CASE explicit when 1 then 1 end),
				    COUNT(CASE explicit when 0 then 0 end), ROUND(AVG(instrumentalness),2),
				    ROUND(AVG(KEY),2), ROUND(AVG(liveness),2), ROUND(AVG(loudness),2), COUNT(CASE mode when 1 then 1 end),
				    COUNT(CASE mode when 0 then 0 end), ROUND(AVG(popularity),2),
				    ROUND(AVG(speechiness),2), ROUND(AVG(tempo),2), ROUND(AVG(valence),2), COUNT(name), 2000
				    FROM stats_all WHERE year >= 2000 AND year < 2010;

INSERT INTO stats_per_decade SELECT ROUND(AVG(acousticness),2), ROUND(AVG(danceability),2), ROUND(AVG(duration_s),2),
				    ROUND(AVG(energy),2), COUNT(CASE explicit when 1 then 1 end),
				    COUNT(CASE explicit when 0 then 0 end), ROUND(AVG(instrumentalness),2),
				    ROUND(AVG(KEY),2), ROUND(AVG(liveness),2), ROUND(AVG(loudness),2), COUNT(CASE mode when 1 then 1 end),
				    COUNT(CASE mode when 0 then 0 end), ROUND(AVG(popularity),2),
				    ROUND(AVG(speechiness),2), ROUND(AVG(tempo),2), ROUND(AVG(valence),2), COUNT(name), 2010
				    FROM stats_all WHERE year >= 2010 AND year <=2021;


INSERT OVERWRITE local directory '/home/colhan/new_stats'
ROW FORMAT delimited
FIELDS TERMINATED BY '|'
select * from stats_per_decade;

--**Most popular Song**
DROP TABLE Most_popular_Song
CREATE TABLE IF NOT EXISTS most_popular_song (name string, popularity float);
INSERT INTO most_popular_song SELECT name, sum(popularity)
			      FROM stats_all group by name;

select * from most_popular_song

--**Most Popular Artists**
DROP TABLE most_popular_artists
CREATE TABLE IF NOT EXISTS most_popular_song (Artists string, popularity float);
INSERT INTO most_popular_artists SELECT artists, sum(popularity)
FROM stats_all group by artists;
select * from most_popular_artists

--**Artist Popularity by Decade-**
DROP TABLE most_popular_artists_20s
CREATE TABLE IF NOT EXISTS most_popular_artists_20s (Artists string, Popularity float, Decade int);
INSERT INTO most_popular_artists_20s SELECT artists, sum(popularity), 1920 FROM stats_all WHERE year >= 1920 AND year < 1930 group by artists;
select * from most_popular_artists_20s

--**Artist Popularity by Decade-**
DROP TABLE most_popular_artists_30s
CREATE TABLE IF NOT EXISTS most_popular_artists_30s (Artists string, Popularity float, Decade int);
INSERT INTO most_popular_artists_30s SELECT artists, sum(popularity), 1930 FROM stats_all WHERE year >= 1930 AND year < 1940 group by artists;
select * from most_popular_artists_30s

--**Artist Popularity by Decade-**
DROP TABLE most_popular_artists_40s
CREATE TABLE IF NOT EXISTS most_popular_artists_40s (Artists string, Popularity float, Decade int);
INSERT INTO most_popular_artists_40s SELECT artists, sum(popularity), 1940 FROM stats_all WHERE year >= 1940 AND year < 1950 group by artists;
select * from most_popular_artists_40s

--**Artist Popularity by Decade-**
DROP TABLE most_popular_artists_50s
CREATE TABLE IF NOT EXISTS most_popular_artists_50s (Artists string, Popularity float, Decade int);
INSERT INTO most_popular_artists_50s SELECT artists, sum(popularity), 1940 FROM stats_all WHERE year >= 1950 AND year < 1960 group by artists;
select * from most_popular_artists_50s

--**Artist Popularity by Decade-**
DROP TABLE most_popular_artists_60s
CREATE TABLE IF NOT EXISTS most_popular_artists_60s (Artists string, Popularity float, Decade int);
INSERT INTO most_popular_artists_60s SELECT artists, sum(popularity), 1940 FROM stats_all WHERE year >= 1960 AND year < 1970 group by artists;
select * from most_popular_artists_60s

--**Artist Popularity by Decade-**
DROP TABLE most_popular_artists_70s
CREATE TABLE IF NOT EXISTS most_popular_artists_70s (Artists string, Popularity float, Decade int);
INSERT INTO most_popular_artists_70s SELECT artists, sum(popularity), 1940 FROM stats_all WHERE year >= 1970 AND year < 1980 group by artists;
select * from most_popular_artists_70s

--**Artist Popularity by Decade-**
DROP TABLE most_popular_artists_80s
CREATE TABLE IF NOT EXISTS most_popular_artists_80s (Artists string, Popularity float, Decade int);
INSERT INTO most_popular_artists_80s SELECT artists, sum(popularity), 1940 FROM stats_all WHERE year >= 1980 AND year < 1990 group by artists;
select * from most_popular_artists_80s

--**Artist Popularity by Decade-**
DROP TABLE most_popular_artists_90s
CREATE TABLE IF NOT EXISTS most_popular_artists_90s (Artists string, Popularity float, Decade int);
INSERT INTO most_popular_artists_90s SELECT artists, sum(popularity), 1940 FROM stats_all WHERE year >= 1990 AND year < 2000 group by artists;
select * from most_popular_artists_90s

--**Artist Popularity by Decade-**
DROP TABLE most_popular_artists_00s
CREATE TABLE IF NOT EXISTS most_popular_artists_00s (Artists string, Popularity float, Decade int);
INSERT INTO most_popular_artists_00s SELECT artists, sum(popularity), 1940 FROM stats_all WHERE year >= 2000 AND year < 2010 group by artists;
select * from most_popular_artists_00s

--**Artist Popularity by Decade-**
DROP TABLE most_popular_artists_10s
CREATE TABLE IF NOT EXISTS most_popular_artists_10s (Artists string, Popularity float, Decade int);
INSERT INTO most_popular_artists_10s SELECT artists, sum(popularity), 1940 FROM stats_all WHERE year >= 2010 AND year < 2021 group by artists;
select * from most_popular_artists_10s