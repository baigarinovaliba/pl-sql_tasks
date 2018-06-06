set SERVEROUTPUT ON
declare
f1 utl_file.file_type;
js clob:='';
s varchar2(100);

begin
f1:=utl_file.fopen('DIR_FOR_ORACLE','js.json','r');
loop
utl_file.get_line(f1,s);
js:=js||' '||s||chr(10);
end loop;

 

exception
 when no_data_found then
 utl_file.fclose(f1);

insert into js_table values(1,js);
DBMS_OUTPUT.PUT_LINE(js);
end;


select * from js_table;

delete from js_table;

create table js_table(
id number(3),
json_data clob,
constraint json_con check(json_data is json))
;

drop table js_table;