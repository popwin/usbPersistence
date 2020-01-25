
### 将parrot系统持久化安装到u盘中

#### 准备工具

1. parrot iso 系统文件
2. ultroISO 用于将iso系统文件写入u盘中，注意对于parrot这个系统只能用uefi启动方式，那么使用ultroISO时，要设置为HDD+模式
3. mini tool partition waizard 用于对已经写入iso文件的u盘进行分区，label标签写成persistence,系统文件为ext4

#### 制作

1. 格式化u盘成fat32

2. 用类似ultroISO的软件(UUI)将iso系统写入u盘

3. 用mini tool partition 对第2步的u盘进行分区，分出一个ext4的persistence分区。分区时候，右键选择`Move\Resize`,调整分区大小。这里主要作的工作就是，将第2步作好的u盘分出一个persistence区，作为数据存储区。也就是说，将u盘分为两个区，一个是系统区，一个是persistence区，各自的大小按需分配。

4. 第3步操作后，会出现一个“未分配区”，对这个“未分配区”进行`create`,`Patition Label`命名为**persistence**,`filesystem`选择 **ext4**

4. 用uefi方式重启电脑，进入parrotOS的persistence选项

5.使用下面的命令，目的在于，将第3步创建的persistence分区永久挂载到u盘的系统

```
sudo -i # 切换成root用户

sudo fdisk -l #找到u盘中persistence分区对应的磁盘文件

mkdir -p /mnt/persistence

#挂载persistence分区
mount /dev/sdc2 /mnt/persistence #sdc2就是刚才创建的persistence分区在fdisk -l 的显示盘符

cd /mnt/persistence

#使u盘系统默认挂载persistence分区
echo "/ union" > persistence.conf

```

6. 重启后以persistence选项进入系统。此时保存各种文件，就直接反映在系统上面了，而不是像live版的系统，重启以后各种配置被清除
