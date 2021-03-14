-- Load uncleaned data
songs = Load 'data.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',',
									       'YES_MULTILINE',
									       'NOCHANGE',
									       'SKIP_INPUT_HEADER')
									       AS
									       (acousticness:float,
									       artists:chararray,
									       danceability:float,
									       duration_ms:long,
									       energy:float,
									       explicit:int,
									       id:chararray,
									       instrumentalness:float,
									       key:int,
									       liveness:float,
									       loudness:float,
									       mode:int,
									       name:chararray,
									       popularity:float,
									       release_date:chararray,
									       speechiness:float,
									       tempo:float, valence:float, year:int);

-- Remove duplicate entries
songs_distinct = DISTINCT songs;

/* 1. Create a new table with relevant columns, removing unnecessary columns.
   2. Round characteristics.
   3. Convert artists array to comma separated list.
   4. Convert song duration from milliseconds to seconds
*/

cleaned = foreach songs_distinct generate ROUND_TO(acousticness,2),
					  REPLACE(REPLACE(REPLACE(REPLACE(artists,'\\[',''),'\\]',''),'\\\'',''),'"',''),
					  ROUND_TO(danceability,2),
					  duration_ms / 1000,
					  ROUND_TO(energy,2),
					  explicit,
					  ROUND_TO(instrumentalness,2),
					  key,
					  ROUND_TO(liveness,2),
					  ROUND_TO(loudness,0),
					  mode,
					  name,
					  popularity,
					  ROUND_TO(speechiness,2),
					  ROUND_TO (tempo,0),
					  ROUND_TO(valence,2),
					  year;

-- export as csv using "|" as separator as commas are included in some song and artists names.
STORE cleaned INTO '/home/colhan/cleaned' USING org.apache.pig.piggybank.storage.CSVExcelStorage('|','YES_MULTILINE','NOCHANGE');
