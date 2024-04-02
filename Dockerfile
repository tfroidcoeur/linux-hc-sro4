FROM ubuntu:23.10
ARG KERNEL_REF=1.20220308_buster 

RUN apt-get update ; \
    apt-get -y install git bc bison flex libssl-dev make libc6-dev libncurses5-dev rsync ; \ 
    apt-get -y install crossbuild-essential-armhf ; \
    apt-get -y install vim ;\
    apt-get -y install bear ;\
    apt-get clean

RUN git clone --branch ${KERNEL_REF} --depth=1 https://github.com/raspberrypi/linux
WORKDIR /linux

RUN KERNEL=kernel make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- bcmrpi_defconfig
RUN bear -- make -j 12 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-
RUN make -j 12 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- headers_install 
WORKDIR /work



