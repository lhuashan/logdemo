CREATE DATABASE logsystem DEFAULT CHARACTER SET utf8 ;
use logsystem;
 
DROP TABLE IF EXISTS sys_log_level;
create table sys_log_level(
level_id  int(10) not null comment '级别ID',
level_desc  varchar(50) CHARACTER SET utf8 comment '级别描述',
PRIMARY KEY (level_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志级别:0:正常；1:一般；2:警告；3:严重警告；4:错误；9:应用日志错误数';

DROP TABLE IF EXISTS log_app_logs;
create table log_app_logs(
server_id  bigint(18) not null comment '服务器IP',
create_dt int(8) not null comment '创建日期,格式：yyyyMMdd',
create_ti  bigint(17) not null comment '创建时间,格式：HHmmss',
logs  longtext CHARACTER SET utf8 comment '日志内容',
PRIMARY KEY (server_id,create_dt,create_ti)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='应用错误日志表';

DROP TABLE IF EXISTS log_server_count;
create table log_server_count(
count_dt int(8) not null comment '统计日期,格式：yyyyMMdd',
server_id  bigint(18) not null comment '服务器IP',
level_id  int(10) not null comment '日志级别',
msg_count int(11) not null default 0 comment '日志条数',
PRIMARY KEY (count_dt,server_id,level_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务器日志统计表';
