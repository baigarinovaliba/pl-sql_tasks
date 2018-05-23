create or replace trigger tr1
before insert or update of hire_date on employees
FOR EACH ROW
begin
if :NEW.hire_date>sysdate then
  RAISE_APPLICATION_ERROR(-20000, 'Hire_date should be designited before realtime');
end if;

end tr1;