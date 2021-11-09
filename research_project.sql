/*Firstly create database*/
create database research_project;

use research_project;

/*In  order to load the big data , i used command line interface , In order to dom this we have create a table*/
create table tvshows
(Sno int,
ID int,
Title varchar(100),
Year int,
Age varchar(5),
IMDB float,
RottenTomatoes float,
Netflix int,
Hulu int,
Primevideo int,
Disney int,
Type int,
Directors varchar(100),
Genre varchar(50),
Country varchar(50),
Language varchar(50),
Runtime int
);

select * from tvshows;


alter table tvshows
drop column type;

/*Total number of shows present in Prime Video*/
select  count(Primevideo) as Prime_Video
from tvshows
where Primevideo=1;

/*Total number of shows present in Netflix*/
select count(netflix) as Netflix
from tvshows
where netflix = 1;

/*Total number of shows present in Hulu*/
select count(hulu) as Hulu
from tvshows
where hulu = 1;

/*Total number of shows present in Disney*/
select count(disney) as Total
from tvshows
where disney= 1;

select * from tvshows;
select * from genres;


/*More recent movies */
select count(year) as More_recent_movie  
from tvshows
where year > 2010 and hulu =0 and disney = 0 and Netflix = 1 and Primevideo = 0; 

select count(year) as More_recent_movie  
from tvshows
where year > 2010 and hulu =1 and disney = 0 and Netflix =0  and Primevideo = 0;

select count(year) as More_recent_movie  
from tvshows
where year > 2010 and hulu =0 and disney = 0 and Netflix =0  and Primevideo = 1;

select count(year) as More_recent_movie  
from tvshows
where year > 2010 and hulu =0 and disney = 1 and Netflix =0  and Primevideo = 0;





select * from tvshows;
select * from genres;


/*Age criteria for netflix tvshows*/
select netflix , count(age) as age18lus
from tvshows
where age = "18+";
 

select netflix , count(age) as age13plus
from tvshows
where age = "13+";

select netflix , count(age) as age7plus
from tvshows
where age = "7+"; 

select netflix , count(age) as Forall
from tvshows
where age = "all"; 


/*Age criteria for Primevideo tvshows*/
select Primevideo , count(age) as age18lus
from tvshows
where age = "18+" and Primevideo=1; 

select Primevideo , count(age) as age13plus
from tvshows
where age = "13+" and Primevideo=1;

select Primevideo , count(age) as age7plus
from tvshows
where age = "7+" and Primevideo=1;

select Primevideo , count(age) as forall
from tvshows
where age = "all" and Primevideo=1;

/*Age criteria for Hulu tvshows*/
select hulu , count(age) as age18plus
from tvshows
where age = "18+" and hulu = 1;

select hulu , count(age) as age13plus
from tvshows
where age = "13+" and hulu = 1;

select hulu , count(age) as age7plus
from tvshows
where age = "7+" and hulu = 1;

select hulu , count(age) as forall
from tvshows
where age = "all" and hulu = 1;

/*Age criteria for Disney+ tvshows*/

select Disney , count(age) as age18plus
from tvshows
where age = "18+" and Disney = 1;

select Disney , count(age) as age13plus
from tvshows
where age = "13+" and Disney = 1;

select Disney , count(age) as age7plus
from tvshows
where age = "7+" and Disney = 1;

select Disney , count(age) as forall
from tvshows
where age = "all" and Disney = 1;

/*Platform best Old movies and tv shows*/
select count(hulu) 
from tvshows
where Year<1980 and hulu =1 and disney = 0 and Netflix = 0 and Primevideo = 0; 

select count(disney) 
from tvshows
where Year<1980 and hulu =0 and disney = 1 and Netflix = 0 and Primevideo = 0; 

select count(netflix) 
from tvshows
where Year<1980 and hulu = 0 and  disney = 0 and Netflix = 1 and Primevideo = 0; 

select count(Primevideo) 
from tvshows
where Year<1980 and hulu =0 and disney = 0 and Netflix = 0 and Primevideo = 1; 

/* Mean of IMDB ratings */
select round(avg(imdb),2)
from tvshows
where netflix = 1;

select round(avg(imdb),2)
from tvshows
where hulu = 1;

select round(avg(imdb),2)
from tvshows
where disney = 1;

select round(avg(imdb),2)
from tvshows
where Primevideo = 1;

/*Rotten tomatoes rating */

 select title , RottenTomatoes
 from tvshows
 where RottenTomatoes between 0 and 100
 order by RottenTomatoes desc;


/* Joining Genre table with tvshows table*/

select *
from tvshows t  inner join genres g
where t.id = g.GenreID ;

select * from tvshows;
select * from genres;


 
 /* Movies which have the highest runtime*/
 
 select id , title , year, runtime
 from tvshows
group by id
order by Runtime desc;

