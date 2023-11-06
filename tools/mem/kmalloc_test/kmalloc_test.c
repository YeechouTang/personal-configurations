// Usage example, alloc 200G: insmod kvalloc.ko alloc_size=200

#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/slab.h>

#define MB (1048576)

static int alloc_size;
static int alloc_index;
static void *point_array[1024000];   /* max: 1000G */

module_param(alloc_size, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
MODULE_PARM_DESC(alloc_size, "Linux kernel memory size, unit is GB");

static int alloc_memory_init(void)
{
    int i;

    if (alloc_size <= 0) {
        pr_info("no valid allocation size\n");
        return 0;
    }

    if (alloc_size > 1000)
        alloc_size = 1000;

    pr_info("alloc size is %d GB memory\n", alloc_size);

    for (i = 0; i < alloc_size * 1024; i++) {
        point_array[i] = kmalloc(MB, GFP_KERNEL);
        if (unlikely(!point_array[i])) {
            pr_info("allocation ended prematurely\n");
            break;
        }
        memset(point_array[i], i % 10, MB);    /* optional */
    }
    alloc_index = i;

    return 0;
}

static void alloc_memory_exit(void)
{
    int i;

    for (i = 0; i < alloc_index; i++) {
        kfree(point_array[i]);
    }
}

module_init(alloc_memory_init);
module_exit(alloc_memory_exit);
MODULE_LICENSE("GPL");
