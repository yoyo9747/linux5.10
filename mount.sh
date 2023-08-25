# ./nullblk-zoned.sh block_size zone_size number_of_conventional_zones number_of_sequential_zones

F2FS_MODULE_PATH=/home/femu/F2FS_WITH_FAR5.10/fs/f2fs
F2FS_TOOLS_PATH=/home/femu/f2fs-tools
F2FS_MOUNT_DIR=/home/femu/mnt
NULLBLK_PATH=/home/femu/F2FS_WITH_FAR5.10
RAW_ZNS=/dev/nvme0n1

sudo umount -t f2fs $RAW_ZNS $F2FS_MOUNT_DIR

#sudo bash $NULLBLK_PATH/delete_ZBD.sh 0

sudo insmod $F2FS_MODULE_PATH/f2fs.ko

#sudo bash $NULLBLK_PATH/create_ZBD.sh 8192 64 2 50

sudo blkzone report $RAW_ZNS

cd $F2FS_TOOLS_PATH && sudo mkfs.f2fs -m -f $RAW_ZNS

sudo mount -t f2fs $RAW_ZNS $F2FS_MOUNT_DIR

# sudo fsck.f2fs /dev/nullb0
# zonesize 8 -> 16384
# zonesize 64 -> 131072
# 4G=64MB*64

# cp /usr/local/share/filebench/workloads/netsfs.f netsfs.f

# sudo filebench -f varmail.f

# /proc/sys/kernel/randomize_va_space : 0
