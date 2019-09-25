
#### 使用docker进行python开发

在docker中运行miniconda，然后将端口映射到主机，主机访问`http://localhost:8888`即可进行编程，实现主机不用安装环境，直接运行docker，docker镜像中安装各种需要的包，即可在主机没有anaconda的时候进行python开发


`docker`文件夹中存放的是用于构建python开发环境的整个files
-----`Dockerfile-dev`  是一个dockerfile，基于miniconda，在这里写明构建的过程中需要运行的命令
-----`Dockerfile-prod` 是生产环境运行的dockerfile
-----`environment.yml` 存放这个docker镜像安装的各种包，其中在pip下面的，是指明用pip安装，其他的是用conda安装

`env_dev`中存放一些全局变量

`docker-compose.yml` 是用docker-compose的文件，这里定义了

* 需要加载的 dockerfile-> Dockerfile-dev,如果是在docker中已经存在了一个镜像，那么也可以直接写入镜像的ID
* 全局变量 env_dev
* 制作镜像的时候挂在的文件夹 code、data、notebooks
* docker中映射到主机的端口port

运行`docker-compose up`，此时jupyter从docker的镜像miniconda中运行，并将7000端口映射到主机的8888端口，此时只要输入token`local_dev`，就可以在主机上运行anaconda，并且编写程序。

PS：
1. 若新建一个镜像，重新加载各种packages，那么使用`docker-compose build `,会按照docker-compose.yml
文件中的设定联网下载 miniconda镜像以及各种需要安装的包,这里要写明`dockerfile`的地址，因为要重新构建。

2. 想要加载的包可以直接写入 `docker/environment.yml` 中，并写那些不能用conda安装的，可以写在pip下面

3. 若加载一个已经导出的镜像 **xyz-python** (里面有加载好的各种包)，那么先在`docker-compose.yml`中
将`build`中的`dockfile`注释掉，然后将image改为本地已加载的image的id。当然，前提是已经把镜像
导入到本地docker中了

```
docker save -o ./xyz-python.tar imageId  导出一个已经建好的镜像

docker load --input xyz-python.tar 加载本地镜像

docker tag id xyz-python:1.0 改名

docker-compose up 直接根据已经加载的镜像启动
```

ps：对于无法用conda 安装的package某，目前的解决方法是在dockerfile中用pip install 直接安装
第3点中已经有了更好的方式，可以不用写在`dockerfile`中了