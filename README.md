本项目是日志系统的技术方案书、环境安装说明、相关代码、测试

1. 日志系统设计说明书：日志系统概要设计.doc

2. 环境安装：

2.1 环境要求
2.1.1 硬件要求：1CPU,2G内存，20G可有空间
2.1.2 软件要求：
    操作系统：  linux 如：redhat6.x或者CentOS 6.x 
    JDK: 1.7.X 
    MySQL: 5.x
    Redis: 2.6.1
    ps. 操作系统的网络、计算机名、JDK、MySQL、Redis 安装配置不在这项目中描述，若有问题，可上网查一下资料或者找我询问。
    防火墙建议直接关闭，若要启动防火墙，则项目中使用到的所有软件使用到的端口必须开放。
    
2.2 hadoop安装
    参考文件：hadoop2.2.0安装.txt

2.3 hive安装    
    参考文件：Hive的安装 .txt

2.4 zookeeper安装    
    参考文件：zookeeper安装.txt    

2.5 storm安装
    参考文件：storm安装.txt

2.6 flume-ng安装
    参考文件：flume-ng1.4.0安装.txt


3 项目的样例
3.1 代码  logdemo.rar

3.2 环境要求:
  mysql中创建数据库logsystem，并导入文件 "MYSQL表.sql" 中的表结构。
  hive中导入文件 "HIVE表.sql" 中的表结构。
  hadoop中创建目录：/logdemo/input, /logdemo/backup, /logdemo/logs
  因项目中未执行HIVE的 SQL操作，需要通过以下方式创建分区:
  上传文件到HDFS中（在demologfile.rar中）
  hadoop fs -put /home/liaghs/log201311011.log /logdemo/backup/
  hive中执行：
  LOAD DATA INPATH '/logdemo/backup/log201311011.log' INTO TABLE log_app_logs PARTITION (pt=201311);
  删除HDFS文件：
  hadoop fs -rm /user/hive/warehouse/log_app_logs/pt=201311/log201311011.log
  
3.3  功能1: 
      从hadoop的 /logdemo/input/目录下读取文件，然后分析，
      统计出错笔数到mysql表 log_server_count
      把错误的日志写入到mysql表 log_app_logs
      把所有日志放入hive表 log_app_logs
  功能2:
      flume-ng用tail -f的方式读取文件/home/lianghs/testflumeinput.log中内容，用push发送到redis中
     然后本demo程序从redis中读取日志数据，然后进行分析，结果处理同上。

3.4 其中logdemo-1.0.jar为已经打好包的程序，修改其中的
   core-site.xml的 hdfs地址和端口
   jdbc.properties中mysql表的地址和端口，并且用户能操作上述的 logsystem库
   jdbcRedis.properties 中redis的地址和端口

3.5 在storm中提交本例子任务
命令：  storm jar /home/lianghs/logdemo-1.0.jar com.telecom.logdemo.LogDemoMain
杀掉任务命令： storm kill logdemo

3.6 生成测试数据：
  java -Djava.ext.dirs=/home/lianghs/ com.telecom.gendata.GenLocalLog 20131120
  生成测试数据追加到 /home/lianghs/testflumeinput.log 中.
  其他日期如 20131121, 20131122, 20131123, 20131124

3.7 上传其他测试数据到hdfs（在demologfile.rar中）:  
  其他的log2013110x.log数据，可以上传到hdfs的/logdemo/input目录下测试。
      
4. 其他源代码
4.1. flume-ng的redis数据库输出插件，从网上找资料整理修改过的。
 flume-ng-redis-sink.rar
  
