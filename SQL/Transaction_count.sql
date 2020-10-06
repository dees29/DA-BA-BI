select * from sessiontb limit 5;

CREATE OR REPLACE FUNCTION maxsession(tbdata varchar(30), tb varchar(30), st int, ed int, method int)
  RETURNS VOID AS
$BODY$
  BEGIN 
    EXECUTE format('DROP TABLE IF EXISTS %I ', tb);
      
    if method = 1 then
      EXECUTE format ('create table %I as select * from
      %I where startpoint >= %L and startpoint <= %L
      UNION
      select * from %I where endpoint >= %L and endpoint <= %L', tb, tbdata, st, ed, tbdata, st, ed) ;
    end if;
    if method = 2 then
      EXECUTE format('create table %I as select * from %I where startpoint >= %L and startpoint <= %L
      INTERSECT
      select * from %I where endpoint >= %L and endpoint <= %L', tb, tbdata, st, ed, tbdata, st, ed);
    end if;
END $BODY$ LANGUAGE plpgsql;

select maxsession('sessiontb','tb1', 3, 8, 1);
select maxsession('sessiontb','tb2', 3, 8, 2);


select * from tb1 limit 10;
select count(*) from tb1;
select * from tb2 limit 10;
select count(*)from tb2; 