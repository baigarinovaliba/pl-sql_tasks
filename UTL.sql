create directory DIR_FOR_ORACLE as 'C:\Oracle_utl';
drop directory dir_for_oracle;
--Write data into file
declare

f1 utl_file.file_type;
begin

f1:=utl_file.fopen('DIR_FOR_ORACLE','abc.txt','w');
utl_file.put_line(f1,'Hello');
utl_file.put_line(f1,'Welcome');
utl_file.fclose(f1);
end;
----------------------------------------------------------------------------------
--Read data from file
set SERVEROUTPUT ON
declare
f1 utl_file.file_type;
type massiv is table of varchar2(40)
index by pls_integer;
arr massiv;
idx number(1):=1;
begin
f1:=utl_file.fopen('DIR_FOR_ORACLE','abc.txt','r');
loop
utl_file.get_line(f1,arr(idx));
DBMS_OUTPUT.PUT_LINE(arr(idx));
idx:=idx+1;
end loop;

exception
 when no_data_found then
    utl_file.fclose(f1);
end;
