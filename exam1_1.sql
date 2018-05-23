SET SERVEROUTPUT ON
declare
cursor c1 is select last_name,first_name,hire_date
             from employees
             where hire_date>(select hire_date from employees
                              where last_name='Smith' and first_name='William');
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
DBMS_OUTPUT.PUT_LINE(arr(i).last_name||' '||arr(i).first_name||' '||arr(i).hire_date||' '||
to_char(round((sysdate-arr(i).hire_date)/365))||' years after Willam Smith');
end loop;
end;