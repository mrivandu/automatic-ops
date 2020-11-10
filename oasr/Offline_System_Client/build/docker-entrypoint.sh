#!/bin/bash
# Author:DURUIHONG
# Build time: 2020-11-10
# E-mail:duruihong@cmos.chinamobile.com

set -eux
cat>/Offline_System_Client/cfg.ini<<-EOF
[general]
#数据库相关
MysqlServerIP=${MYSQLSERVERIP}
MysqlServerPort=${MYSQLSERVERPORT}
MysqlDatabase=${MYSQLDATABASE}
MysqlUser=${MYSQLUSER}
MysqlPassword=${MYSQLPASSWORD}

#引擎服务器标识
processorId=${PROCESSORID}

#redis服务相关
redisCluster=${REDISCLUSTER}
#redis单节点地址
redisIp=${REDISIP}
redisPort=${REDISPORT}
#redis集群地址
redisAdd=${REDISADD}
#redis集群密码
redisPass=${REDISPASS}
redisTaskList=${REDISTASKLIST}
redisNotifyList=${REDISNOTIFYLIST}

#声道数 Mono：单  Stereo：双
channels=${CHANNELS}

#语种 zhn：中文，eng：英语
language=${LANGUAGE}

#关键词列表
keywordlist=${KEYWORDLIST}

#存放xml结果的目录后缀
xmlPathPostfix=${XMLPATHPOSTFIX}

#DeleteTempResult：是否删除中间结果
DeleteTempResult=${DELETETEMPRESULT}

#DeleteOriginalWav：是否删除原始语音
DeleteOriginalWav=${DELETEORIGINALWAV}

#maxHandleThread：并行处理语音最大线数
maxHandleThread=${MAXHANDLETHREAD}

#判断超时时长，语音时长的倍数
timeoutRate=${TIMEOUTRATE}
#检查的频率
checkPeriod=${CHECKPERIOD}

taskCtrlShell=${TASKCTRLSHELL}

#wavFormat:语音格式
#  1：128kbps的pcm: 8k_16bit_PCM
wavFormat=${WAVFORMAT}

#stereo_on:双声道语音转码方式，取值及说明如下：
#  1：指单声道或者将分录双声道合并成单声道进行处理
#  2：指将分录双声道的左右声道解码成两个单声道
#  3：指将分录双声道的左右声道解码成两个单声道同时，还需合并成一个单声道
#  4：指合录双声道，左右声道内容一样，都是多个人的对话
stereo_on=${STEREO_ON}

#logEvents：需要打的日志级别 0-15，小于设定值的日志将被写入日志文件。参见如下宏定义；
#  0：不输出日志    
#  1：fatal errors, UL_LOG_FATAL 
#  2：exceptional events, UL_LOG_WARNING 
#  4：informational notices, UL_LOG_NOTICE
#  8：program tracing, UL_LOG_TRACE
logEvents=${LOGEVENTS}

#logToSyslog：输出到syslog 中的日志级别, 0-15，参见logEvents部分的宏定义   
logToSyslog=${LOGTOSYSLOG}

#logSpec：扩展开关 0 or @ref UL_LOGTTY or @ref UL_LOGNEWFILE，参见如下宏定义；
#  2   /**<   日志在输出到日志文件的同时输出到标准出错(stderr)中 */
#  8    /**<   创建新的日志文件,可以使每个线程都把日志打到不同文件中*/
#  16    /**<  按大小分割日志文件，不回滚*/    
logSpec=${LOGSPEC}

#logMaxLen,单个日志文件的最大长度（单位: MB）
logMaxLen=${LOGMAXLEN}

[server]
#请保持各参数的相对位置，不要随意改变
KwsAndRecServer=${KWSANDRECSERVER}
KwsAndRecServerIP=${KWSANDRECSERVERIP}
KwsAndRecServerPort=${KWSANDRECSERVERPORT}
ClusterAndSceneServer=${CLUSTERANDSCENESERVER}
ClusterAndSceneServerIP=${CLUSTERANDSCENESERVERIP}
ClusterAndSceneServerPort=${CLUSTERANDSCENESERVERPORT}
InterruptionServer=${INTERRUPTIONSERVER}
InterruptionServerIP=${INTERRUPTIONSERVERIP}
InterruptionServerPort=${INTERRUPTIONSERVERPORT}
XMLServer=${XMLSERVER}
XMLServerIP=${XMLSERVERIP}
XMLServerPort=${XMLSERVERPORT}
EOF

exec "$@"