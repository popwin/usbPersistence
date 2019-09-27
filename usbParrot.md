
### 将parrot系统持久化安装到u盘中

#### 准备工具

1. parrot iso 系统文件
2. ultroISO 用于将iso系统文件写入u盘中，注意对于parrot这个系统只能用uefi启动方式，那么使用ultroISO时，要设置为HDD+模式
3. mini tool partition waizard 用于对已经写入iso文件的u盘进行分区，label标签写成persistence,系统文件为ext4

#### 制作

1. 格式化u盘成fat32

2. 用类似ultroISO的软件将iso写入u盘

3. 用mini tool partition 对已经写入iso的u盘进行分区，分出一个ext4的persistence分区

4. 用uefi方式重启电脑，进入parrot的persistence选项

5.使用下面的命令，将刚才创建的persistence分区，持续挂在到系统中

```
sudo -i # 切换成root用户

mkdir -p /mnt/persistence

mount /dev/sdc2 /mnt/persistence #sdc2就是刚才创建的persistence分区在fdisk -l 的显示盘符

cd /mnt/persistence

echo "/ union" > persistence.conf

```

6. 重启后再次进入persistence选项后，保存各种文件，则直接在系统上进行更改
