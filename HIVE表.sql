
DROP TABLE IF EXISTS log_detail;
create table log_detail(
trace_id  bigint,
trace_rp_id  string,
create_dt  bigint,
level_id  int,
user_id int,
adderss_id int,
client_type_id int,
source_ip bigint,
target_ip bigint,
message  string,
msg_log  string
)
PARTITIONED BY(pt string);

DROP TABLE IF EXISTS log_app_logs;
create table log_app_logs(
server_id  bigint,
create_dt  bigint,
log_level  string,
logs  string
)
PARTITIONED BY(pt string);

LOAD DATA INPATH '/logdemo/backup/log201311013.log' INTO TABLE log_app_logs PARTITION (pt=201311);