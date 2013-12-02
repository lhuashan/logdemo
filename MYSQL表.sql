CREATE DATABASE logsystem DEFAULT CHARACTER SET utf8 ;
use logsystem;
 
DROP TABLE IF EXISTS sys_log_level;
create table sys_log_level(
level_id  int(10) not null comment '����ID',
level_desc  varchar(50) CHARACTER SET utf8 comment '��������',
PRIMARY KEY (level_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��־����:0:������1:һ�㣻2:���棻3:���ؾ��棻4:����9:Ӧ����־������';

DROP TABLE IF EXISTS log_app_logs;
create table log_app_logs(
server_id  bigint(18) not null comment '������IP',
create_dt int(8) not null comment '��������,��ʽ��yyyyMMdd',
create_ti  bigint(17) not null comment '����ʱ��,��ʽ��HHmmss',
logs  longtext CHARACTER SET utf8 comment '��־����',
PRIMARY KEY (server_id,create_dt,create_ti)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ӧ�ô�����־��';

DROP TABLE IF EXISTS log_server_count;
create table log_server_count(
count_dt int(8) not null comment 'ͳ������,��ʽ��yyyyMMdd',
server_id  bigint(18) not null comment '������IP',
level_id  int(10) not null comment '��־����',
msg_count int(11) not null default 0 comment '��־����',
PRIMARY KEY (count_dt,server_id,level_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��������־ͳ�Ʊ�';
