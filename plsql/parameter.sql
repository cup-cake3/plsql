set serveroutput on;
declare
cursor c1(rno number) is select * from studmarks where rollno=rno;
tmp studmarks%rowtype; --takes entire row in tmp variable
-- tmp c1%rowtype;   alternative
A number;
begin
A:=&A;
for tmp in c1(A) loop
dbms_output.put_line('name: '|| tmp.name1||' total marks '|| tmp.totalmarks);
end loop;
end;
