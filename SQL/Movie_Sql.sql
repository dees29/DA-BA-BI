drop table if exists pairmovie_1;

create table pairmovie_1 as 
SELECT a.userid as user_id, a.movieid as movieid1, b.movieid as movieid2,
avg(a.rating) as rating1, avg(b.rating) as rating2
FROM udata a INNER JOIN udata b ON a.userid = b.userid and a.movieid > b.movieid
group by user_id, movieid1, movieid2 order by user_id;


select * FROM pairmovie_1 limit 10;
select count(*) FROM pairmovie_1;

drop table if exists corrrating;


create table corrrating as
select movieid1, movieid2, corr(rating1, rating2) as ratingcor,
count(*) as usernum from pairmovie_1 group by movieid1, movieid2 having not corr(rating1, rating2) is NULL order by ratingcor desc;

select * FROM corrrating

drop table if exists corrratingnew;
drop table if exists pairmovie_1;

create table corrratingnew as select b.movie as movie1, c.movie as movie2, ratingcor, usernum
from corrrating a, uitem b, uitem c where a.movieid1 = b.movieid and a.movieid2 = c.movieid
order by ratingcor desc, usernum desc;

drop table if exists corrrating;
select * from corrratingnew limit 10;


