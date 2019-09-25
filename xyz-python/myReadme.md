

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