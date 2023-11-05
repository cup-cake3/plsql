set serveroutput on
create or replace procedure procgrade
as   --like declare section
cursor c1 is select * from studmarks;
rno studmarks.rollno%type;  -- data type of roll will go to rno if datatype not known
nm studmarks.name1%type;
tm studmarks.totalmarks%type;
cat varchar(20);
begin
open c1;
loop
fetch c1 into rno,nm,tm;
exit when c1%notfound;
if(tm<=1500 and tm>=990) then
cat:='Distinction';
elsif(tm>=900 and tm<=989) then
cat:='First';
elsif(tm<=899 and tm>=825) then
cat:='Highersecond';
else
cat:='fail';
end if;
insert into result values(rno,nm,cat);
end loop;
close c1;
end procgrade;