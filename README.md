# Transparent-HugePages-THP-configuration-of-the-system
Transparent HugePages (THP) configuration of the system

The kernel automatically merges small memory pages into larger ones to reduce the size of the page table, thus improving memory access efficiency

内核自动地将小的内存页面合并成大页面，以减少页表的大小，从而提高内存访问效率

The system will use transparent big pages for shared memory (shmem). Shared memory is an area of memory that allows multiple processes to share data, and the use of transparent big pages improves the performance of shared memory.

系统将对共享内存（shmem）使用透明大页。共享内存是一种允许多个进程共享数据的内存区域，使用透明大页可以提高共享内存的性能。
