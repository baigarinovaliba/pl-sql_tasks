create or replace function f1(emp_id in number)
return varchar2
is
v_country COUNTRIES.COUNTRY_NAME%type;

begin
select country_name into v_country
from employees e,departments d,locations l,countries c
where e.department_id=d.department_id and d.location_id=l.location_id and l.country_id=c.country_id
and employee_id=emp_id;

return v_country;
end f1;


begin
DBMS_OUTPUT.PUT_LINE(f1(100));
end;