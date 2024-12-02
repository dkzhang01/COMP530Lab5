 #!/bin/bash
# Daniel Zhang, 730463377
gb=1073741824
mb=1048576
kb=1024
device="/dev/sdb1"
# Run first round of tests
echo "Round one" > results.txt
echo "Starting size"
echo "Starting size" >> results.txt
./test -d $device -s $((4 * kb)) >> results.txt
./test -d $device -s $((200 * kb)) >> results.txt
./test -d $device -s $((500 * kb)) >> results.txt
./test -d $device -s $((1 * mb)) >> results.txt
./test -d $device -s $((10 * mb)) >> results.txt
./test -d $device -s $((25 * mb)) >> results.txt
./test -d $device -s $((50 * mb)) >> results.txt
./test -d $device -s $((75 * mb)) >> results.txt
./test -d $device -s $((100 * mb)) >> results.txt
echo "Starting Round 2" >> results.txt
echo "Starting Round 2"
./test -d $device -s $((4 * kb)) >> results.txt
./test -d $device -s $((200 * kb)) >> results.txt
./test -d $device -s $((500 * kb)) >> results.txt
./test -d $device -s $((1 * mb)) >> results.txt
./test -d $device -s $((10 * mb)) >> results.txt
./test -d $device -s $((25 * mb)) >> results.txt
./test -d $device -s $((50 * mb)) >> results.txt
./test -d $device -s $((75 * mb)) >> results.txt
./test -d $device -s $((100 * mb)) >> results.txt
echo "Starting Round 3" >> results.txt
echo "Starting Round 3"
./test -d $device -s $((4 * kb)) >> results.txt
./test -d $device -s $((200 * kb)) >> results.txt
./test -d $device -s $((500 * kb)) >> results.txt
./test -d $device -s $((1 * mb)) >> results.txt
./test -d $device -s $((10 * mb)) >> results.txt
./test -d $device -s $((25 * mb)) >> results.txt
./test -d $device -s $((50 * mb)) >> results.txt
./test -d $device -s $((75 * mb)) >> results.txt
./test -d $device -s $((100 * mb)) >> results.txt
