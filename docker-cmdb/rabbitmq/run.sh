#!/bin/bash
# 以上信息需要在 rabbitmq 中添加:
# 用户 shark  命令为: rabbitmqctl add_user shark QFedu123
# 虚拟主机 qfvhost 命令为: rabbitmqctl add_vhost qfvhost
# 授权信息  命令为: rabbitmqctl set_permissions -p qfvhost shark ".*" ".*" ".*"
RABBITMQ_USER=zxh
RABBITMQ_PASSWORD=zxh123
# Create Rabbitmq user
rabbitmq-server &
sleep 10
while true
do
    rabbitmqctl ping &>/dev/null
    if [ "$?" -eq 0 ];then
        rabbitmqctl ping
        rabbitmqctl add_user $RABBITMQ_USER $RABBITMQ_PASSWORD &&  rabbitmqctl add_vhost qfvhost && rabbitmqctl set_permissions -p qfvhost $RABBITMQ_USER  ".*" ".*" ".*"
        break
    fi
done
rabbitmqctl stop
if [ "$?" -eq 0 ];then
   rabbitmq-server
fi
