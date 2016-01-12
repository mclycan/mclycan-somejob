create  table user(
	userid int(255) primary key auto_increment,
	mail varchar(255) not null unique,
	uploadtime datetime not null,
	filename varchar(255) not null
) AUTO_INCREMENT=1;