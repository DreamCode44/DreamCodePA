drop database if exists PA; 


create database PA;

use PA;

create table inicio_sesion(usuario varchar (40),
							correo varchar(40),
							contra varchar(40));
                            
create table doctor(usuario varchar (40),
					correo varchar(40),
					contra varchar(40));

insert into doctor(usuario,correo,contra) values
("Ivan","Ivan@gmail.com","12345");
                            
select * from inicio_sesion;
select * from doctor;
