create or replace trigger tr1
before insert or update of job_id on employees
for each row
begin
if inserting and :NEW.job_id='AD_PRES' then
  RAISE_APPLICATION_ERROR(-20000, 'You can not add another President, President already exist');
elsif updating and :NEW.job_id='AD_PRES' then
  RAISE_APPLICATION_ERROR(-20001, 'You can not update job_id to PRESIDENT, President already exist');
end if;


end tr1;

