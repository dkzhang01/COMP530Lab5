 #!/bin/bash
# Daniel Zhang, 730463377
gb=1073741824
mb=1048576
kb=1024
device="/dev/sdb1"
# Run first round of tests
echo "Round one" > results.txt
echo "Starting stride"
echo "Starting stride" >> results.txt
echo "Starting for 4kb"
./test -d $device -s $((4 * kb)) -t $((4 * kb)) >> results.txt
./test -d $device -s $((4 * kb)) -t $((200 * kb)) >> results.txt
./test -d $device -s $((4 * kb)) -t $((500 * kb)) >> results.txt
./test -d $device -s $((4 * kb)) -t $((1 * mb)) >> results.txt
./test -d $device -s $((4 * kb)) -t $((25 * mb)) >> results.txt
./test -d $device -s $((4 * kb)) -t $((50 * mb)) >> results.txt
./test -d $device -s $((4 * kb)) -t $((100 * mb)) >> results.txt
echo "Starting for 100kb"
./test -d $device -s $((100 * kb)) -t $((4 * kb)) >> results.txt
./test -d $device -s $((100 * kb)) -t $((200 * kb)) >> results.txt
./test -d $device -s $((100 * kb)) -t $((500 * kb)) >> results.txt
./test -d $device -s $((100 * kb)) -t $((1 * mb)) >> results.txt
./test -d $device -s $((100 * kb)) -t $((25 * mb)) >> results.txt
./test -d $device -s $((100 * kb)) -t $((50 * mb)) >> results.txt
./test -d $device -s $((100 * kb)) -t $((100 * mb)) >> results.txt
echo "Starting for 1mb"
./test -d $device -s $((1 * mb)) -t $((4 * kb)) >> results.txt
./test -d $device -s $((1 * mb)) -t $((200 * kb)) >> results.txt
./test -d $device -s $((1 * mb)) -t $((500 * kb))>> results.txt
./test -d $device -s $((1 * mb)) -t $((1 * mb)) >> results.txt
./test -d $device -s $((1 * mb)) -t $((25 * mb)) >> results.txt
./test -d $device -s $((1 * mb)) -t $((50 * mb)) >> results.txt
./test -d $device -s $((1 * mb)) -t $((100 * mb)) >> results.txt
echo "Starting for 4mb"
./test -d $device -s $((4 * mb)) -t $((4 * kb)) >> results.txt
./test -d $device -s $((4 * mb)) -t $((200 * kb)) >> results.txt
./test -d $device -s $((4 * mb)) -t $((500 * kb))>> results.txt
./test -d $device -s $((4 * mb)) -t $((1 * mb)) >> results.txt
./test -d $device -s $((4 * mb)) -t $((25 * mb)) >> results.txt
./test -d $device -s $((4 * mb)) -t $((50 * mb)) >> results.txt
./test -d $device -s $((4 * mb)) -t $((100 * mb)) >> results.txt
echo "Starting for 10mb"
./test -d $device -s $((10 * mb)) -t $((4 * kb)) >> results.txt
./test -d $device -s $((10 * mb)) -t $((200 * kb)) >> results.txt
./test -d $device -s $((10 * mb)) -t $((500 * kb))>> results.txt
./test -d $device -s $((10 * mb)) -t $((1 * mb)) >> results.txt
./test -d $device -s $((10 * mb)) -t $((25 * mb)) >> results.txt
./test -d $device -s $((10 * mb)) -t $((50 * mb)) >> results.txt
./test -d $device -s $((10 * mb)) -t $((100 * mb)) >> results.txt
