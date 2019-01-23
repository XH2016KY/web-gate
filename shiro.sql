
-- 用户管理服务数据库
create database usermanager default character set=utf8mb4 collate utf8mb4_general_ci;
use usermanager;
-- 用户管理服务的数据表
-- 用户表
create table tb_user(
   user_id varchar(65) not null comment '用户id',
   user_name varchar(65) not null default 'NULL' comment '用户名称',
   user_password varchar(64) not null default 'NULL' comment '用户密码',
   user_status varchar(10) not null default 'NULL' comment '用户状态',
   user_create_time datetime not null default NOW() comment '用户创建时间',
   user_update_time datetime not null default NOW() comment '用户更新时间',
   user_mail varchar(64) not null default 'NULL' comment '用户邮箱',
   user_phone varchar(64) not null default 'NULL' comment '用户电话',
   user_login_status varchar(10) not null default 'NULL' comment '用户在线状态',
   user_sex varchar(5) default 'NULL' comment '用户性别',
   user_age int(5) default '0'comment '用户年龄',
   PRIMARY key(user_id),
   unique user_name(user_name),
   unique user_mail(user_mail),
   unique user_phone(user_phone)
)ENGINE=INNODB CHARSET=UTF8 comment '用户表';
-- alter table tb_user drop user_log;
alter table tb_user add user_log varchar(64) comment '用户log图链接地址';
alter table tb_user add user_address varchar(200) comment '用户地址';

-- 角色表
create table tb_role(
   role_id int auto_increment comment '角色id',
   role_name varchar(64) not null comment '角色名称',
   role_create_time datetime not null default NOW() comment '角色创建时间',
   role_update_time datetime not null default NOW() comment '角色更新时间',
   unique role_name(role_name),
   PRIMARY KEY(role_id)  
)ENGINE=INNODB CHARSET=UTF8 comment '角色表';

-- 权限表
create table tb_permission(
   permission_id int auto_increment comment '权限id',
   permission_name varchar(64) not null comment '权限名称',
   permission_create_time datetime not null comment '权限创建时间',
   permission_update_time datetime not null comment '权限更新时间',
   unique permission_name(permission_name),
   PRIMARY KEY(permission_id)
)ENGINE=INNODB CHARSET=UTF8 comment '权限表';

-- 用户角色表
create table tb_user_role(
   user_id varchar(65) not null comment '用户id',
   role_id int not null comment '角色id',
   index user_id(user_id),
   index role_id(role_id)
)ENGINE=INNODB CHARSET=UTF8 comment '用户角色表';

-- 角色权限表
create table tb_role_permission(
   role_id int not null comment '角色id',
   permission_id INT not null comment '权限id',
   index role_id(role_id),
   index permission_id(permission_id)
)ENGINE=INNODB CHARSET=UTF8 comment '角色权限表';

-- 用户管理日志表
create table tb_user_log(
   log_id BIGINT auto_increment comment 'logId',
   user_id varchar(65),
   update_time datetime not null comment '修改时间',
   role_id int not null comment '角色id',
   permission_id int not null comment '权限id',
   PRIMARY key(log_id),
   index user_id(user_id)
)ENGINE=INNODB CHARSET=UTF8 comment '用户管理日志表';

-- sql 获取一个用户的所有权限
select permission_name from tb_permission p
       LEFT JOIN tb_role_permission rp
          on p.permission_id = rp.permission_id            
             LEFT JOIN tb_user_role ur
                on rp.role_id = ur.role_id
                  LEFT JOIN tb_user u
                      on ur.user_id = u.user_id
where u.user_id = '1539934600697141392';

-- sql 获取一个用户的所有角色
select role_name from tb_role r
       LEFT JOIN tb_user_role ur
          on r.role_id = ur.role_id
              LEFT JOIN tb_user u
                 on ur.user_id = u.user_id
where u.user_id = '1539934600697141392';


