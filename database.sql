mysql -u root -p

create database portfolio;
use portfolio;

/*
    pass column in table is 96 long
    32 + 64 = 96
    salt is 32 chars long
    hash is 64 chars long
*/

create table user (
    user_id int auto_increment primary key not null,
    user_name varchar(20) not null,
    pass char(96) not null
);

create table project (
	project_id int auto_increment primary key not null,
	project_name varchar(50) not null,
	description varchar(10000),
	link_site varchar(100),
	link_github varchar(100)
);

create table category (
	category_id int auto_increment primary key not null,
	category_name varchar(20) not null,
	colour varchar(10)
);

create table pcrelation (
	project_id int not null,
	category_id int not null,
	
	primary key (project_id, category_id),
	foreign key (project_id) references project(project_id),
	foreign key (category_id) references category(category_id)
);

create table image (
	image_id int auto_increment primary key not null,
	src varchar(100) not null	
);

create table pirelation (
	project_id int not null,
	image_id int not null,
	
	primary key (project_id, image_id),
	foreign key (project_id) references project(project_id),
	foreign key (image_id) references image(image_id)
);