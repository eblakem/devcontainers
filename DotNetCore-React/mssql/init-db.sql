use master 
go 

create database App;

use App;
go 

create table dbo.Person (
	PersonId bigint identity(1,1) not null
);

-- etc etc...
