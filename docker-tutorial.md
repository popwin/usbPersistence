
* docker system prune 删除已经停用的images
* docker system prune --volumes 删除已经停用的vol
* docker container ls -a 列出所有容器
* docker container rm id 删除容器
* docker container prune 删除已停用的容器
  
  
* docker pull 拉image下来
* docker commit -a "popwin" -m "nodejs" id xyz:1.0

* docker save -o ./xyz-node.tar imageId 将镜像导出到当前文件夹
* docker load --input ./xyz-node.tar 将镜像导入docker的镜像中
* docker tag imageId xyz-node:1.3 导入镜像后name为none ，修改名字及tag

*sudo docker ps -qf status=exited 显示已经退出的容器id



* sudo docker rm $(sudo docker ps -qf status=exited) 根据容器的状态，删除Exited状态的容器

* sudo docker run -d --name xyz -p3306:3306 xyz/node:1.1 //run in quiet
* sudo docker exec -it xyz /bin/bash //into the bash shell when exit the container not stop


* sudo docker run --name xyz-db -e MYSQL_ROOT_PASSWORD=1234 -P3306:3306 -d mysql

* sudo docker run --name some-mysql -v /my/custom:/etc/mysql/conf.d -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql // under custom there is config-file.cnf file
