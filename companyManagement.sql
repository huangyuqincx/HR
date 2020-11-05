-- 创建数据库
create database companyManagement;

use companyManagement;

drop  table if exists employees;
drop  table if exists worketype;
drop  table if exists jobplace;
drop  table if exists applyform;

-- 员工表
create table employees(
    eId int auto_increment primary key  comment '员工id,主键id',
    eEmploynumber varchar(20) not null comment '员工号',
    ePassword varchar(50) not null comment '员工密码，MD5加密后的密码',
    eName varchar(30) not null comment '员工姓名',
    eSex  varchar(2) not null comment '员工性别 1:男，0：女',
    eBirthday Date comment '员工的出生日期：年月日',
    eNational varchar(10) comment '员工所属民族',
    eEducation varchar(5) comment '文化程度',
    ePolitical varchar(5) comment '政治面目',
    eWorktime Date not null comment '开始工作时间-入职时间',
    eContracttime Date not null comment '合同期限',
    eDriverlicence  varchar(2) comment '驾驶执照 1：有;0：无',
    
    eWorktype int not null comment '工种id 与工种表对应 ',
    eWorkplace int not null comment '工作地点id 与工作地点表对应 ',
    
    ePostsalary decimal(7,2) not null default 0 comment '岗位工资-- 对应工种表中的工资字段 不能为空',
    eSkillsalary decimal(7,2) default 0 comment '技能工资：类似于奖金 可以为空',
    eFilesalry decimal(7,2) default 0 comment '档案工资：展示为弄清楚其用法，保留',
    eTotalsalry decimal(10,2) default 0 comment '累计工资,所有基础工资加奖金',
    eHomeaddress varchar(50) not null comment '家庭住址',
    eZipcode varchar(10)  comment '邮编',
    eIdcard varchar(20) not null comment '身份证号 18位',
    eTelephone varchar(13) not null  comment '联系电话',
    eEmail varchar(30) not null comment '邮箱',
    
    create_user int comment '创建人的id，一旦创建不会变更',
    create_time datetime comment '创建的时间，一旦创建不会变更',
    update_user int comment '执行更新操作人的id，每执行更新便会更新',
    update_time datetime comment '更新时间，每执行更新便会更新',
    
    attr1 varchar(50) comment '预留字段一',
    attr2 varchar(50) comment '预留字段二'
    
) comment '员工表';

-- 公司职位表(工种表)

create table worketype (
    wId int auto_increment primary key comment '工种id 主键id',
    wType varchar(3) not null comment '工种对应的类型：01：司机，02：售票.....,用于生成员工号',
    wName varchar(10) not null comment '工种名称', 
    wSalary decimal(7,2) not null default 0 comment '工种对应的工资',
    
    create_user int comment '创建人的id，一旦创建不会变更',
    create_time datetime comment '创建的时间，一旦创建不会变更',
    update_user int comment '执行更新操作人的id，每执行更新便会更新',
    update_time varchar(20) comment '更新时间，每执行更新便会更新'
    
) comment '工种表';

-- 工作地点表
create table jobplace(
	pId int auto_increment primary key comment '工作地点id 主键id',
    pName varchar(10) not null comment '工作地点名称', 
    
    create_user int comment '创建人的id，一旦创建不会变更',
    create_time datetime comment '创建的时间，一旦创建不会变更',
    update_user int comment '执行更新操作人的id，每执行更新便会更新',
    update_time datetime comment '更新时间，每执行更新便会更新'
) comment '工作地点表';

-- 申请信息表
create table applyform(
    aId int auto_increment primary key comment '申请id，主键id',
    aEId int comment '申请人id,即员工id',
    aDealid int comment '处理人的id,即管理员id',
    aType varchar(2) not null comment '申请的类型，0：调入，1：调出，2：内部调动',
    aStatus varchar(2) not null default '0' comment '审核状态 0：未审核，1：审核通过，2：驳回',
    aOriginalunit varchar(10) not null comment '工作地点id 与工作地点表对应 原单位',
    aNewunit varchar(10) comment '工作地点id 与工作地点表对应 新单位',
    aDate datetime not null comment '申请时间',
    aDealtime datetime comment '申请处理时间', 
    aMess varchar(200) comment '员工申请理由',
    aRetmess varchar(200) comment '审核意见',
    
    attr1 varchar(50) comment '预留字段一',
    attr2 varchar(50) comment '预留字段二'
    
) comment '申请信息表';

-- select * from employees;


insert into employees(eEmploynumber,ePassword,eName,eSex,eBirthday,eNational,eEducation,ePolitical,eWorktime,eContracttime,eWorktype,eWorkplace,ePostsalary,eHomeaddress,eIdcard,eTelephone,eEmail,create_time) 
values('202001001','admin','admin',1,date(now()),'汉族','大学本科','群众',date(now()),'2022-10-31',1,1,5000,'四川成都','511322199910275652','13096141049','1925192939@qq.com',now());

-- select * from worketype;

insert into worketype (wType,wName,wSalary,create_time) values('01','干部','5000',now());
insert into worketype (wType,wName,wSalary,create_time) values('02','司机','5000',now());
insert into worketype (wType,wName,wSalary,create_time) values('03','售票','4000',now());
insert into worketype (wType,wName,wSalary,create_time) values('04','保养工','4000',now());
insert into worketype (wType,wName,wSalary,create_time) values('05','高度','5000',now());
insert into worketype (wType,wName,wSalary,create_time) values('06','核算','3000',now());
insert into worketype (wType,wName,wSalary,create_time) values('07','窗口票','3500',now());
insert into worketype (wType,wName,wSalary,create_time) values('08','加油','3000',now());
insert into worketype (wType,wName,wSalary,create_time) values('09','护厂','5000',now());
insert into worketype (wType,wName,wSalary,create_time) values('10','锅炉工','4000',now());
insert into worketype (wType,wName,wSalary,create_time) values('11','炊事员','6000',now());
insert into worketype (wType,wName,wSalary,create_time) values('12','保育员','6000',now());
insert into worketype (wType,wName,wSalary,create_time) values('13','茶炉','3000',now());
insert into worketype (wType,wName,wSalary,create_time) values('14','其它人员','2000',now());

-- select * from jobplace;
insert into jobplace (pName,create_time) values('其他',now());
insert into jobplace (pName,create_time) values('东直门',now());
insert into jobplace (pName,create_time) values('莲花池',now());
insert into jobplace (pName,create_time) values('天桥',now());
insert into jobplace (pName,create_time) values('北郊',now());
insert into jobplace (pName,create_time) values('内勤',now());
insert into jobplace (pName,create_time) values('保修厂',now());

