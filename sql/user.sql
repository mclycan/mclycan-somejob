# 创建数据库；
create database userinfo;

# 创建数据库表 user；
create  table user(
	userid int(255) primary key auto_increment,
	mail varchar(255) not null unique,
	uploadtime datetime not null,
	filename varchar(255) not null
) ENGINE=INNODB AUTO_INCREMENT=1;

# 创建数据库表 task；
create  table task(
	taskid int(255) primary key auto_increment,
	salt char(8) not null ,
	encrypted_masterkey char(48) not null,
	encrypted_seckey char(48) not null,
	pubkey char(32) not null,
	minlen int(10) ,
	maxlen int(10) ,
	prefix varchar(10) ,
	suffix varchar(10) ,
	createtime datetime not null,
	begintime datetime ,
	finishtime datetime ,
	status varchar(2) not null,
	userid int(255) not null,
	foreign key(userid) references user(userid)
) ENGINE=INNODB AUTO_INCREMENT=1;

# 创建数据库表 subtask；
create  table subtask(
	subtaskid int(255) primary key auto_increment,
	prefix varchar(10) not null,
	suffix varchar(10) not null,
	minlen int(10) not null,
	maxlen int(10) not null,
	starttime datetime ,
	finshtime datetime ,
	status varchar(2) not null,
	taskid int(255) not null,
	foreign key(taskid) references task(taskid)
) ENGINE=INNODB AUTO_INCREMENT=1;

# 创建数据库表 terminal；
create  table terminal(
	terminalid int(255) primary key auto_increment,
	nickname varchar(255) not null,
	ipaddress int(16) not null,
	connecttime datetime ,
	lasttime datetime ,
	status varchar(1) not null,
	banned varchar(2) not null,
	bannedtime datetime 
) ENGINE=INNODB AUTO_INCREMENT=1;