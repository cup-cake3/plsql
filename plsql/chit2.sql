set SERVEROUTPUT ON;
declare
rno number;
nob varchar(20);
nod number;
amt number;
doi date;

begin
rno:=&rno;
nob:=&nob;

select dateofissue into doi from borrower where rollno=rno and nameofbook=nob;
nod:=sysdate - doi;
if(nod>=15 and nod<=30)then
amt:=5*nod;
elsif(nod>30) then
amt:=50*nod;
else 
dbms_output.put_line('No fine');
end if;

if(nod>=15) then
insert into fine values(rno,sysdate,amt);
end if;

update borrower
set status='r' where rollno=rno and nameofbook=nob;

exception
when no_data_found then
dbms_output.put_line('NO DATA found!!');
when others then
dbms_output.put_line('Error mate!!');
end;
