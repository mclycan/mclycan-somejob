# 创建数据库；
create database userinfo;

# 创建数据库表 user；
create  table user(
	userid int(255) primary key auto_increment,
	mail varchar(255) not null unique,
	uploadtime datetime not null,
	filename varchar(255) not null,
	banned varchar(2) not null
) ENGINE=INNODB AUTO_INCREMENT=1;

# 创建数据库表 task；
create  table task(
	taskid int(255) primary key auto_increment,
	salt varchar(100) not null ,
	encrypted_masterkey varchar(100) not null,
	encrypted_seckey varchar(100) not null,
	pubkey varchar(100) not null,
	minlen int(10) ,
	maxlen int(10) ,
	prefix varchar(10) ,
	suffix varchar(10) ,
	createtime datetime not null,
	begintime datetime ,
	finishtime datetime ,
	status varchar(2) not null,
	analysis varchar(2) not null,
	userid int(255) not null,
	foreign key(userid) references user(userid)
) ENGINE=INNODB AUTO_INCREMENT=1;

# 创建数据库表 subtask；
create  table subtask(
	taskid int(255) not null,
	subtaskid int(255) primary key auto_increment,
	prefix varchar(10) not null,
	suffix varchar(10) not null,
	minlen int(10) not null,
	maxlen int(10) not null,
	starttime datetime ,
	finshtime datetime , #error
	status varchar(2) not null,
	executor varchar(255) ,
	foreign key(taskid) references task(taskid)
) ENGINE=INNODB AUTO_INCREMENT=1;

# 创建数据库表 terminal；
create  table terminal(
	terminalid int(255) primary key auto_increment,
	nickname varchar(255) not null,
	ipaddress varchar(50) not null,
	connecttime datetime ,
	lasttime datetime ,
	status varchar(1) not null,
	banned varchar(2) not null,
	bannedtime datetime 
) ENGINE=INNODB AUTO_INCREMENT=1;

# test data for paper, NO. 2




# test data for paper
insert into terminal(nickname, ipaddress, connecttime, lasttime, status, banned) 
values("David","192.168.10.106","2016-02-21 16:01:14", "2016-02-21 16:06:15", 1, 0);
insert into terminal(nickname, ipaddress, connecttime, lasttime, status, banned) 
values("John","192.168.10.106","2016-02-21 16:02:03", "2016-02-21 16:07:03", 1, 0);
insert into terminal(nickname, ipaddress, connecttime, lasttime, status, banned) 
values("William","192.168.10.106","2016-02-21 16:02:35", "2016-02-21 16:07:36", 1, 0);
insert into terminal(nickname, ipaddress, connecttime, lasttime, status, banned) 
values("Amy","192.168.10.106","2016-02-21 16:03:47", "2016-02-21 16:08:47", 1, 0);

insert into user(mail, uploadtime, filename, banned) values("mclycan@163.com","2016-02-21 15:58:31","mc.dat", 0);

insert into task(salt, encrypted_masterkey, encrypted_seckey, pubkey, minlen, maxlen, prefix, suffix, createtime, begintime, status, analysis, userid) 
values("f0f0f0f0f0f0f0f0", "dbf76df2546c7895fe7a29c115a82aba299fcee6d580d0d53c27aefbcd7bc977e714a2b2d112c65f59b61eef52e7995c", 
	"ce56a6d330b5b9a73f185b6cbb3cfa2b84013c4a88a3c881a3790b89b24effc9ea2e3d19edec29b6ce3229fc05aac858", 
	"02001a7561a23c743600271c94015fd0345b01f40a63028fb66885a7fc3821f557", 
	4, 4, "K", "K", "2016-02-21 15:59:12", "2016-02-21 16:02:47", 1, 1, 1);

insert into subtask(prefix, suffix, minlen, maxlen, starttime, status, taskid, executor) 
values("K", "K", 3, 4, "2016-02-21 16:02:48", 2, 1, "David");
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid, executor) 
values("K0", "K", 4, 4, "2016-02-21 16:02:48", "2016-02-21 16:02:49", 2, 1, "John");
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid, executor) 
values("K1", "K", 4, 4, "2016-02-21 16:02:48", "2016-02-21 16:02:50", 2, 1, "William");
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid, executor) 
values("K2", "K", 4, 4, "2016-02-21 16:02:49", "2016-02-21 16:02:52", 2, 1, "John");
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid, executor) 
values("K3", "K", 4, 4, "2016-02-21 16:02:50", "2016-02-21 16:02:52", 2, 1, "William");
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid, executor) 
values("K4", "K", 4, 4, "2016-02-21 16:02:52", "2016-02-21 16:02:54", 2, 1, "John");
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid, executor) 
values("K5", "K", 3, 4, "2016-02-21 16:02:52", "2016-02-21 16:02:53", 2, 1, "William");
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid, executor) 
values("K6", "K", 4, 4, "2016-02-21 16:02:53", "2016-02-21 16:02:55", 2, 1, "William");
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid, executor) 
values("K7", "K", 4, 4, "2016-02-21 16:02:54", "2016-02-21 16:02:56", 2, 1, "John");
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid, executor) 
values("K8", "K", 4, 4, "2016-02-21 16:02:55", "2016-02-21 16:02:57", 2, 1, "William");

select * from subtask where subtaskid < 11;


UPDATE task SET finishtime = "2016-02-21 16:04:06", status = 2 WHERE taskid = 1;

# test data 

insert into task(salt, encrypted_masterkey, encrypted_seckey, pubkey, minlen, maxlen, prefix, suffix, createtime, begintime, finishtime, status, userid) 
values("test1", "test1", "test1", "test1", 2, 8, "a", "k", "2016-01-13 14:50:31", "2016-01-13 16:12:23", "2016-01-14 10:10:34", 2, 1);

insert into task(salt, encrypted_masterkey, encrypted_seckey, pubkey, minlen, maxlen, prefix, suffix, createtime, begintime, finishtime, status, userid) 
values("test2", "test2", "test2", "test2", 1, 4, " ", " ", "2016-01-13 16:17:33", "2016-01-14 10:11:43", " ", 1, 2);

insert into task(salt, encrypted_masterkey, encrypted_seckey, pubkey, minlen, maxlen, prefix, suffix, createtime, begintime, finishtime, status, userid) 
values("test3", "test3", "test3", "test3", 3, 5, " ", " ", "2016-01-13 18:43:56", " ", " ", 0, 3);

insert into task(salt, encrypted_masterkey, encrypted_seckey, pubkey, minlen, maxlen, prefix, suffix, createtime, begintime, finishtime, status, userid) 
values("test3", "test3", "test3", "test3", 5, 8, " ", " ", "2016-01-15 13:43:56", " ", " ", 0, 6);


insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("aa", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("ab", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("ac", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("ad", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("ae", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("af", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("ag", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("ah", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("ai", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("aj", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("ak", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("al", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("am", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("an", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("ao", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("ap", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("aq", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("ar", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("as", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("at", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("au", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("av", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("aw", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("ax", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("ay", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("az", "k", 2, 8, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 1);



insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "a", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "b", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "c", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "d", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "e", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "f", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "g", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 2, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "h", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 1, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "i", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "j", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "k", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "l", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "m", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "n", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "o", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "p", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "q", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "r", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "s", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "t", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "u", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "v", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "w", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "x", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "y", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 2);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 1, 4, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 2);



insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);
insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("a", "z", 3, 5, "2016-01-13 18:43:56", "2016-01-13 18:43:56", 0, 3);

insert into subtask(prefix, suffix, minlen, maxlen, starttime, finshtime, status, taskid) 
values("kobe", "!", 5, 8, "", "", 0, 6);




SELECT mail, uploadtime from user ORDER BY userid

# 联合查询
select user.mail, user.uploadtime, task.createtime, task.finishtime from user ,task where user.userid = task.userid ORDER BY user.userid;

# 总子任务数
select count(*) from subtask where subtask.taskid = 1;

# 完成子任务数
select count(*) from subtask where subtask.taskid = 1 and status = 2;


UPDATE task
SET createtime = "2016-01-13 15:59:13"
WHERE taskid = 2;

UPDATE task
SET createtime = "2016-01-13 15:01:27"
WHERE taskid = 3;