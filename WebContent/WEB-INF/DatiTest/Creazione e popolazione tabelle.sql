drop table comments;
drop table cinguetts;
drop table users;


create table users
(
id number(38,0),
name varchar2(50),
surname varchar2(50),
email varchar2(254),
password varchar2(128),
urlimageprofile varchar(500),
birthday date,
constraint pk_users_id primary key(id)
);


create table cinguetts(
id number(38,0),
text varchar2(150),
user_id number(38,0),
post_time date,
constraint pk_cinguetts_id primary key(id),
constraint fk_cinguetts_users_id foreign key(user_id) references users(id)
);

create table comments(
id number(38,0),
text varchar2(150),
post_time date,
user_id number(38,0),
cinguett_id number(38,0),
constraint pk_comments_id primary key(id),
constraint fk_comments_cinguetts_id foreign key (cinguett_id) references cinguetts(id),
constraint fk_comments_users_id foreign key (user_id) references users(id)
);


insert into users values(0,'Marco', 'Micheli','marco@gmail.com', 'password','default.jpg',to_date('1993-06-16', 'yyyy-mm-dd'));
insert into users values(1,'Alessandro', 'Ortu','alessandro@gmail.com', 'password','default.jpg',to_date('1992-11-27', 'yyyy-mm-dd'));
insert into users values(2,'Mara', 'Medda','mara@gmail.com', 'password','default.jpg',to_date('1993-10-25', 'yyyy-mm-dd'));
insert into users values(3,'Davide', 'Scintu','davide@gmail.com', 'password','default.jpg',to_date('1995-01-12', 'yyyy-mm-dd'));
insert into users values(4,'Federico', 'Spiga','federico@gmail.com', 'password','default.jpg',to_date('1995-01-10', 'yyyy-mm-dd'));