set SERVEROUTPUT ON;
declare
rno number;
atten number;
begin
rno:=&rno;

select att into atten from stud where roll=rno;
if(atten<75) then
dbms_output.put_line('Detention');
update stud
set status='d' where roll=rno;
else
dbms_output.put_line('Term granted');
end if;
exception
when no_data_found then
dbms_output.put_line('Record not found');
when others then
dbms_output.put_line('ERROR');
end;
