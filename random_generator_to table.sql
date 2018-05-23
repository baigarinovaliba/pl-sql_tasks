create or replace procedure random_generator(quantity in number)
is
cursor c1 is select e.last_name LASTNAME,e.first_name FIRSTNAME,d.department_name DEP_NAME
             from employees e,departments d
             where e.department_id=d.department_id;
type massiv is table of c1%rowtype
index by pls_integer;
arr massiv;
cnt number:=0;
idx number;
begin

open c1;
fetch c1 bulk collect into arr;
close c1;

loop
idx:=dbms_random.value(arr.FIRST,arr.LAST); 
if arr.exists(idx) then
insert into tab_rand_generator values(arr(idx).lastname,arr(idx).firstname,arr(idx).dep_name);
arr.delete(idx);
cnt:=cnt+1;
end if;
exit when cnt=quantity;
end loop;

end random_generator;


create table tab_rand_generator(
LASTNAME varchar2(50),
FIRSTNAME varchar2(50),
DEP_NAME varchar2(50)
);

select * from tab_rand_generator;


begin
random_generator(50);
end;