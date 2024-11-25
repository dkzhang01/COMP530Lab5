#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <limits.h>
#include <fcntl.h>
#include <time.h>
#include <sys/time.h>

int main(int argc, char**argv) {
    char device[PATH_MAX] = "";
    int c;
    int debug = 0;
    int random = 0;
    size_t size = 1 << 20; //Set default value 1mb
    size_t disk_size = 1<<30; // set default 1 gb
    size_t stride = 0; //set default value 1 mb
    size_t lower_random = 0;
    size_t upper_random = disk_size;

    while ((c = getopt(argc, argv, "d:s:t:rl:u:he")) != -1) {
        switch (c) {
            case 'd':
                strcpy(device, optarg);
                break;
            case 's':
                size = atoi(optarg);
                if (size < (4<<10)) {
                    perror("Error, size too low\n");
                    return 0;
                }
                if (size > (100 << 20)) {
                    perror("Error, size too high\n");
                    return 0;
                }
                break;
            case 't':
                stride = atoi(optarg);
                if (stride < (4<<10)) {
                    perror("Error, stride too low\n");
                    return 0;
                }
                if (stride > (100 << 20)) {
                    perror("Error, stride to high\n");
                    return 0;
                }
                break;
            case 'r':
                random = 1;
                srandom(time(0));
                upper_random = disk_size - size;
                break;
            case 'l':
                lower_random = atoi(optarg);
                break;
            case 'u':
                upper_random = atoi(optarg);
                break;

            case 'h':
                //display help information
                printf("Options\n");
                printf("\t-d DEVICE: do IO size experiment on DEVICE\n");
                printf("\t-s IO_SIZE: set size of each IO in bytes\n");
                printf("\t-t STRIDE: set space between each IO request\n");
                printf("\t-r: do IO on random offsets\n");
                printf("\t-l: set lower bound for random offset selection\n");
                printf("\t-u: set upper bound for random offset selection\n");
                printf("\t-e: turn on debug mode (checks read is same as write)\n");
                printf("\t-h: shows this help menu\n");
                return 0;
            case 'e':
                printf("Running debug mode\n");
                debug = 1;
                break;
            default:
                printf("Unknown option. Use -h to get help\n");
                return 1;
            

        }
    }
    if (device[0] == '\0') {
        return 1;
    }
    // add O_DIRECT flag
    int disk = open(device, O_RDWR | O_SYNC | O_DIRECT);
    if (disk < 0) {
        perror("Failed to open device\n");
        return 0;
    }
    struct timeval start_write, end_write, start_read, end_read;
    char buffer[size];
    memset(buffer, 0x55, size);
    
    int io_operations = ((disk_size - size) / (size + stride)) + 1;

    int i = 0;
    lseek(disk, 0, SEEK_SET);
    gettimeofday(&start_write, NULL);
    while (i < io_operations) {
        if (random) {
            size_t offset = (rand() % (upper_random - lower_random)) + lower_random;
            lseek(disk, offset, SEEK_SET);
        }
        write(disk, buffer, size);
        fsync(disk);
        if (stride != 0) {
            lseek(disk, stride, SEEK_CUR);
        }
        i++;
    }
    gettimeofday(&end_write, NULL);
    
    char buffer2[size];
    lseek(disk, 0, SEEK_SET);
    gettimeofday(&start_read, NULL);
    i = 0;
    while (i < io_operations) {
        read(disk, buffer2, size);
        if (random) {
            size_t offset = (rand() % (upper_random - lower_random)) + lower_random;
            lseek(disk, offset, SEEK_SET);
        }
        else if (stride != 0) {
            lseek(disk, stride, SEEK_CUR);
        }
        i++;
        if (debug) {
            if (memcmp(buffer, buffer2, size) != 0) {
                printf("read different from what was written\n");
            }
        
        }
    }
    gettimeofday(&end_read, NULL);
    if (debug) {
        for (int i = 0; i < 100; i++) {
            printf("%02x ", (unsigned char)buffer2[i]);
            if ((i + 1) % 16 == 0) {
                printf("\n");  // Add a newline every 16 bytes for readability
            }
        }
        printf("\n");
    }
    
    double time_write = (end_write.tv_sec - start_write.tv_sec) + ((double)(end_write.tv_usec - start_write.tv_usec) / 1000000);
    double time_read = (end_read.tv_sec - start_read.tv_sec) + ((double)(end_read.tv_usec - start_read.tv_usec) / 1000000);
    printf("[Device %s, size %zu, stride %zu, random %d, lower bound %zu, upper bound %zu]: write of %f, read of %f\n", device, size, stride, random, lower_random, upper_random, time_write, time_read);
    close(disk);
    return 1;
}
