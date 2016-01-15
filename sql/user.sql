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
	finshtime datetime , #error
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


# test data


insert into task(salt, encrypted_masterkey, encrypted_seckey, pubkey, minlen, maxlen, prefix, suffix, createtime, begintime, finishtime, status, userid) 
values("test1", "test1", "test1", "test1", 2, 8, "a", "k", "2016-01-13 14:50:31", "2016-01-13 16:12:23", "2016-01-14 10:10:34", 2, 1);

insert into task(salt, encrypted_masterkey, encrypted_seckey, pubkey, minlen, maxlen, prefix, suffix, createtime, begintime, finishtime, status, userid) 
values("test2", "test2", "test2", "test2", 1, 4, " ", " ", "2016-01-13 16:17:33", "2016-01-14 10:11:43", " ", 1, 2);

insert into task(salt, encrypted_masterkey, encrypted_seckey, pubkey, minlen, maxlen, prefix, suffix, createtime, begintime, finishtime, status, userid) 
values("test3", "test3", "test3", "test3", 3, 5, " ", " ", "2016-01-13 18:43:56", " ", " ", 0, 3);



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




SELECT mail, uploadtime from user ORDER BY userid

# 联合查询
select user.mail, user.uploadtime, task.createtime, task.finishtime from user ,task where user.userid = task.userid ORDER BY user.userid;

# 总子任务数
select count(*) from subtask where subtask.taskid = 1;

# 完成子任务数
select count(*) from subtask where subtask.taskid = 1 and status = 2;