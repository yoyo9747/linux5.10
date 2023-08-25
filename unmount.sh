F2FS_MODULE_PATH=/home/femu/F2FS_WITH_FAR5.10/fs/f2fs
F2FS_TOOLS_PATH=/home/femu/f2fs-tools
F2FS_MOUNT_DIR=/home/femu/mnt
NULLBLK_PATH=/home/femu/F2FS_WITH_FAR5.10
RAW_ZNS=/dev/nvme0n1

sudo umount -t f2fs $RAW_ZNS $F2FS_MOUNT_DIR

#sudo bash $NULLBLK_PATH/delete_ZBD.sh 0

sudo rmmod f2fs

cd /home/femu/libzbd-PartialReset/testcode && sudo ./zone_reset 0
cd /home/femu/libzbd-PartialReset/testcode && sudo ./dummycmd 0
#sudo ./home/femu/libzbd-PartialReset/testcode/dummycmd 0

sudo dmesg -c
