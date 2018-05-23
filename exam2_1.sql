set SERVEROUTPUT ON
declare

cursor c1 is select d.department_name DEP_NAME,round(avg(e.salary)) AVERAGE
             from employees e,departments d
             where e.department_id=d.department_id
             group by d.department_name
             having avg(e.salary)>6000
             order by average desc;
type massiv is table of c1%rowtype
index by pls_integer;
arr massiv;
idx number :=1;
begin

open c1;
loop
fetch c1 into arr(idx);
exit when c1%notfound;
idx:=idx+1;
end loop;
close c1;
for  i in arr.FIRST..arr.LAST loop
DBMS_OUTPUT.PUT_LINE(arr(i).dep_name||' '||arr(i).average);
end loop;
end;