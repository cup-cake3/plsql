set SERVEROUTPUT ON;
begin
merge into n_rollcall 
using o_rollcall
on (o_rollcall.rollno=n_rollcall.rollno)
--when matched then
--update set name1=old_rollcall.name1
when not matched then 
insert values(o_rollcall.rollno,o_rollcall.name1);

if sql%found then
dbms_output.put_line('merged');
else
dbms_output.put_line('not merged');
end if;
if sql%rowcount>0 then
dbms_output.put_line(sql%rowcount || 'rows updated');
else
dbms_output.put_line('no rows updated');
end if;
end;

