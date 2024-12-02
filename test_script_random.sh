 #!/bin/bash
# Daniel Zhang, 730463377
gb=1073741824
mb=1048576
kb=1024
device="/dev/sdb1"
# Run first round of tests
echo "Round one" > results.txt
echo "Starting Random IO"
echo "Starting Random IO" >> results.txt
#./test -d $device -s $((4 * kb)) -r >> results.txt
./test -d $device -s $((200 * kb)) -r >> results.txt
./test -d $device -s $((500 * kb)) -r >> results.txt
echo "Finished 500kb"
./test -d $device -s $((1 * mb)) -r >> results.txt
echo "Finished 1mb"
./test -d $device -s $((10 * mb)) -r >> results.txt
./test -d $device -s $((25 * mb)) -r >> results.txt
./test -d $device -s $((50 * mb)) -r >> results.txt
./test -d $device -s $((75 * mb)) -r >> results.txt
./test -d $device -s $((100 * mb)) -r >> results.txt
echo "Finished Round one"  
