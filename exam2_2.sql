create or replace function f2(emp_id in number)
return number
is

cursor c1 is select count(employee_id) 
             from employees e, departments d, locations l
             where e.department_id=d.department_id and d.location_id=l.location_id
             and l.city = (select l.city from employees e,departments d,locations l
                            where e.department_id=d.department_id and d.location_id=l.location_id and e.employee_id=emp_id);
cnt number;                           
begin
open c1;
fetch c1 into cnt;
close c1;

return cnt-1;
end f2;

begin
DBMS_OUTPUT.PUT_LINE(f2(100));
END;
