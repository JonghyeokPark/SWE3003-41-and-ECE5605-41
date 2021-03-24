# Lab #2

## Overview

In this lab, you will run the TPC-C benchmark on MySQL 5.7 by varying the buffer pool size of MySQL. And you will analyze how the change in buffer pool size affected MySQL and the overall system's performance.

- Release Date: Monday, March 22
- **Due Date: Sunday, April 4 @ 11:59pm**
- If you have any questions, please contact me via email (Mijin An / meeeeejin@gmail.com)

> NOTE: This lab is based on the Linux environment. If you don't have a Linux machine, use [VirturalBox](https://www.virtualbox.org/). (Recommend Ubuntu 18.04)

## Instructions

### Mount devices (Optional)

- If you have more than one storage device on your PC, read and try [this guide](reference/mount-guide.md) to separate data and log devices

### 1. Install MySQL 5.7 and TPC-C

- Follow the [installation guide](reference/tpcc-mysql-install-guide.md) to install and run TPC-C benchmark on MySQL 5.7

### 2. Run the TPC-C benchmark and collect performance metrics 

- Refer to the [performance analysis guide](reference/performance-analysis-guide.md) to gather performance metrics while running the TPC-C benchmark on MySQL 5.7
- **Follow the instructions below to fill out and submit a report**
    1. Check your system's spec by referring to this [guide](reference/performance-analysis-guide.md) and specify it in the report. For example:

        | Type | Specification |
        |:-----------:|:----------------------------------------------------------:|
        | OS          | Ubuntu 18.04.5 LTS                                         |
        | CPU         | Intel(R) Xeon(R) Silver 4216 CPU @ 2.10GHz (Total 32 cores)|
        | Memory      | 32GB                                                       |
        | Kernel      | 5.4.0-66-generic                                           |
        | Data Device *(Optional)* | Intel® Optane™ SSD 900P Series 480GB          |
        | Log Device *(Optional)* | Samsung 850 PRO SSD 256GB                      |
    
        - If you didn't mount any device, specify the device's name on which the root file system is mounted:
            1. Check your device using `mount | grep "on / type"`
            2. Then, find the device model name using `sudo smartctl -a /dev/sda1` for SATA devices and `sudo nvme list` for NVMe devices

    2. Specify the experimental setup of MySQL and TPC-C in the report. For example:

        | Type | Configuration |
        |:----------------:|:----------------------:|
        | DB size          | 2GB (20 warehouse)     |
        | Buffer Pool Size | 500MB, 1GB (25% and 50% of DB size, respectively) |
        | Benchmark Tool   | tpcc-mysql             |
        | Runtime          | 1200s                  |
        | Connections      | 8                      |

    3. Run the TPC-C benchmark by varying the buffer pool size (`innodb_buffer_pool_size`) in the `my.cnf` file (e.g., 25% and 50% of DB size, respectively)

    4. *While running the benchmark*, collect performance metrics (I/O status and hit ratio) and record them in a separate file for future analysis
    
    5. After the benchmark ends, take a screenshot of the TPC-C output and add it to your report

### 3. Analyze the benchmark results

- Combine all the results and analyze how the change in buffer pool size affected MySQL and the overall system's performance
    - For example, draw a graph (e.g., Transaction throughput, IOPS, etc.) and compare the performance:
    ![tpcc-graph](https://www.percona.com/blog/wp-content/uploads/2013/06/tpcc-graph1.jpg)
- Also, compare how I/O performance metrics change depending on the buffer size and understand what they mean
- Finally, draw your own conclusions about the benchmark results
- **Do not simply list the results of the experiment, but describe the meaning of each indicator**

## Submission

Submit **a single PDF file** named `LAB2_STUDENTID_NAME.pdf` (e.g., `LAB2_2021123456_MijinAn.pdf`) to **i-Campus**.

- There is no page limit for the report
