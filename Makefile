obj-m += hc-sro4.o

ARCH=arm
CROSS_COMPILE=/usr/bin/arm-linux-gnueabihf-
# KERNEL_DIR=/lib/modules/3.18.0-trunk-rpi/build
KERNEL_DIR=../linux
# CC=arm-linux-gnueabihf-gcc

all:
	make -C $(KERNEL_DIR) M=$(PWD) modules ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE)

clean:
	make -C $(KERNEL_DIR) M=$(PWD) clean ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE)
