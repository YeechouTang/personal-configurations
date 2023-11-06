obj-m       := kmalloc_test.o
module-objs := kmalloc_test.o

KERNELDIR := /usr/src/linux-headers-5.4.0-164-generic/

PWD := $(shell pwd)

all:
	make -C $(KERNELDIR) M=${PWD} modules

clean:
	rm -rf *.o .cmd *.ko *.mod.c .tmp_versions *.symvers
