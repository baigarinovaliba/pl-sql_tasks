declare
date1 date:=to_date('01-01-2001','DD.MM.YYYY');
date2 date:=to_date('30-06-2018','DD.MM.YYYY');
begin

while(date1<=date2)loop
insert into dim_time(dimDate,dimDay,dimWeek,dimMonth,dimQuarter,dimYear) values(date1,to_number(to_char(date1,'DDD')),to_number(to_char(date1,'WW')),to_number(to_char(date1,'MM')),to_number(to_char(date1,'Q')),to_char(date1,'YYYY'));
DBMS_OUTPUT.PUT_LINE(to_char(date1));
date1:=date1+1;

end loop;

end;


select * from dim_time;

delete from dim_time;

create table dim_time(
dimDate date,
dimDay number(10),
dimWeek number(10),
dimMonth number(10),
dimQuarter number(10),
dimYear number(10)
);

drop table dim_time;


select sysdate,to_char(sysdate,'YYYY') from dual;





