set serveroutput on;
create or replace trigger t1 before update or delete on library
for each row
declare
op varchar(20);
begin
if updating then
op:='Update';
end if;
if deleting then
op:='delete';
end if;

insert into libraryaudit values(:old.bookid,:old.bookname,:new.bookname,op);
end;