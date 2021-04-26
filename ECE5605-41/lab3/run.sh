#!/bin/bash

if [ $# -ne 1 ]
then
  echo "Usage: $0 MOUNTPOINT"
  exit 1
fi

MOUNTPOINT=$1
dir="fio-out-dir"
mkdir $dir

for num in 1 5 10 15 20 25 30
do
  OUTPUT=$dir"/fsync-test-"${num}.txt

  fio --filename=$MOUNTPOINT --size=1GB \
  --direct=1 --rw=randwrite --bs=4k --ioengine=libaio \
  --iodepth=1 --runtime=300 --numjobs=1 \
  --name=$OUTPUT --time_based --output=$OUTPUT \
  --fsync=${num}
done

echo "Finished!"