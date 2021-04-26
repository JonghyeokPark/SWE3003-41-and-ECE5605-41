# Lab3. Analysis for the performance degradation of fsync() using FIO

## Overview
In this lab, you will build FIO while varying the nubmer of fsync() calls. Also you will analyze how fsync() operation impacts on the overall storage performance.

- Release Date: Monday, April 26
- **Due Date: Sunday, May 2 @ 11:59pm**
- If you have any questions, please request a issue in the Github.

> NOTE: This lab is based on the Linux environment. If you don't have a Linux machine, use [VirturalBox](https://www.virtualbox.org/). (Recommend Ubuntu 18.04)

## Instructions

### Install FIO 

```
git clone https://github.com/axboe/fio.git

./configure
make -j
sudo make install -j
```

### Check FIO version

```
fio --version

# compare the version with "FIO-VERSION-FILE" in fio directory.
```

### Check Environment Setup

```
# Query CPU model
sudo lscpu 

# Query Memory size
sudo grep MemTotal /proc/meminfo

# Display disk and portions information
sudo fdisk -l 

# Query the device information 
- Option1. for SATA devices
sudo hdparm -I /dev/xxx 

- Option2. For Nvme Devices 
sudo nvme list 
```


### Run script

- Run run.sh script with mountpoint (i.e, where the fio perform IO request) parameter

```
./run.sh ./ssd/mountpoint
```


## Submission

Submit **a single PDF file** named `LAB3_STUDENTID_NAME.pdf` (e.g., `LAB2_2021123456_JonghyeokPark.pdf`) to **I-Campus**.

- There is no page limit for the report