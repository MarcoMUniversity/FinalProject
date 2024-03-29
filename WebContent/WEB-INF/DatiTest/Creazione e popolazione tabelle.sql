drop table comments; 
drop table cinguetts; 
drop table users; 


create table users ( 
id number(38,0), 
name varchar2(50) NOT NULL, 
surname varchar2(50) NOT NULL, 
email varchar2(254) NOT NULL UNIQUE,
password varchar2(128) NOT NULL, 
urlimageprofile varchar(500) NOT NULL,
birthday date NOT NULL, 
constraint pk_users_id primary key(id) ); 


create table cinguetts( 
id number(38,0), 
text varchar2(150) NOT NULL, 
user_id number(38,0) NOT NULL, 
post_time date NOT NULL, 
constraint pk_cinguetts_id primary key(id), 
constraint fk_cinguetts_users_id foreign key(user_id) references users(id) ); 


create table comments( 
id number(38,0), 
text varchar2(150) NOT NULL, 
post_time date NOT NULL, 
user_id number(38,0) NOT NULL, 
cinguett_id number(38,0) NOT NULL, 
constraint pk_comments_id primary key(id), 
constraint fk_comments_cinguetts_id foreign key (cinguett_id) references cinguetts(id), 
constraint fk_comments_users_id foreign key (user_id) references users(id) ); 

insert into users values(0,'Marco', 'Micheli','marco@gmail.com', 'password','view/Resources/default.png',to_date('1993-06-16', 'yyyy-mm-dd')); 
insert into users values(1,'Alessandro', 'Ortu','alessandro@gmail.com', 'password','view/Resources/default.png',to_date('1992-11-27', 'yyyy-mm-dd')); 
insert into users values(2,'Mara', 'Medda','mara@gmail.com', 'password','view/Resources/default.png',to_date('1993-10-25', 'yyyy-mm-dd')); 
insert into users values(3,'Davide', 'Scintu','davide@gmail.com', 'password','view/Resources/default.png',to_date('1995-01-12', 'yyyy-mm-dd')); 
insert into users values(4,'Federico', 'Spiga','federico@gmail.com', 'password','view/Resources/default.png',to_date('1995-01-10', 'yyyy-mm-dd')); 


insert into cinguetts values(0, 'Sciao sono Marco er mejo der colosseo', 0, TO_DATE('2019-05-15 8:30:25', 'YYYY-MM-DD HH24:MI:SS')); 
insert into cinguetts values(1, 'Ciao sono eskere', 2, TO_DATE('2018-05-15 8:30:25', 'YYYY-MM-DD HH24:MI:SS')); 
insert into cinguetts values(2, 'Buongiornissimo vado in pasticceria', 1, TO_DATE('2019-04-15 8:30:25', 'YYYY-MM-DD HH24:MI:SS')); 
insert into cinguetts values(3, 'Ho voglia di gelato', 4, TO_DATE('2019-05-16 8:30:25', 'YYYY-MM-DD HH24:MI:SS')); 
insert into cinguetts values(4, 'Ho voglia di fritto', 3, TO_DATE('2019-05-15 8:30:20', 'YYYY-MM-DD HH24:MI:SS')); 
insert into cinguetts values(5, 'Samu tvb.... veroooo!!!', 2, TO_DATE('2019-05-15 9:30:10', 'YYYY-MM-DD HH24:MI:SS')); 
insert into cinguetts values(6, 'Cinguetter the best 4EVER', 1, TO_DATE('2019-05-15 5:30:25', 'YYYY-MM-DD HH24:MI:SS')); 
insert into cinguetts values(7, 'Che bella giornata', 1, TO_DATE('2019-05-15 16:30:25', 'YYYY-MM-DD HH24:MI:SS')); 
insert into cinguetts values(8, 'I love sushi', 2, TO_DATE('2019-05-15 18:30:25', 'YYYY-MM-DD HH24:MI:SS')); 
insert into cinguetts values(9, 'I love cinghialetto con pizzae asparagusu', 4, TO_DATE('2019-05-15 20:30:25', 'YYYY-MM-DD HH24:MI:SS')); 
insert into cinguetts values(10, 'Team cinglett', 2, TO_DATE('2019-05-15 14:30:25', 'YYYY-MM-DD HH24:MI:SS')); 
insert into cinguetts values(11, 'Enjoy Java', 3, TO_DATE('2019-05-15 15:30:25', 'YYYY-MM-DD HH24:MI:SS')); 


insert into comments values(0, 'Bravo bro sesi su mellusu', TO_DATE('2019-06-25 8:30:25', 'YYYY-MM-DD HH24:MI:SS'), 0, 2 ); 
insert into comments values(1, 'Buuuu!?!?!? sono il fantasma formaggino', TO_DATE('2019-06-25 8:40:25', 'YYYY-MM-DD HH24:MI:SS'), 1, 2 ); 
insert into comments values(2, 'Viva la pioggia)', TO_DATE('2019-06-25 8:35:25', 'YYYY-MM-DD HH24:MI:SS'), 4, 4 ); 
insert into comments values(3, 'Anche a me', TO_DATE('2019-06-25 8:32:25', 'YYYY-MM-DD HH24:MI:SS'), 3, 0 ); 
insert into comments values(4, 'Tvb anche io', TO_DATE('2019-06-25 8:37:25', 'YYYY-MM-DD HH24:MI:SS'), 3, 0 );
insert into comments values(5, 'Sono Samu: Mi mancano le competenze in Java', TO_DATE('2019-06-25 8:36:15', 'YYYY-MM-DD HH24:MI:SS'), 3, 3 );