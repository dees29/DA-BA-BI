drop table if exists public.past_due_fix;

create table public.past_due_fix as 
SELECT cusid, report_date, past_due, RANK ()
OVER ( PARTITION BY cusid ORDER BY report_date ) as seqmonth
FROM public.past_due;

select * from public.past_due_fix limit 10;


drop table if exists public.past_due__sum;

create table past_due_sum as SELECT seqmonth, count(*) as cnt,
SUM( CASE past_due WHEN 'Yes' THEN 1 ELSE 0 END ) AS "pastduenum"
FROM public.past_due_fix group by seqmonth order by seqmonth;

select * from past_due_sum limit 20;


drop table if exists result_cohort;

create table result_cohort as select seqmonth, cnt, pastduenum,
sum(pastduenum) OVER (PARTITION BY cnt ORDER BY seqmonth) AS pastduenum_cum,
(select sum(pastduenum) from past_due_sum) as tot_pastduenum,
round(100*sum(pastduenum) OVER (PARTITION BY cnt ORDER BY seqmonth)/
(select sum(pastduenum) from past_due_sum),1) as bad_rate
FROM public.past_due_sum ORDER BY seqmonth;

select * from result_cohort;
