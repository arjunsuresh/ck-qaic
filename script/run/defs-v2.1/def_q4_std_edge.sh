#!/bin/bash

# BERT-99% (mixed precision).
BERT99_OFFLINE_OVERRIDE_BATCH_SIZE=4096
BERT99_OFFLINE_TARGET_QPS=2800
BERT99_SINGLESTREAM_TARGET_LATENCY=7.3

# ResNet50.
RESNET50_OFFLINE_TARGET_QPS=77000
RESNET50_SINGLESTREAM_TARGET_LATENCY=0.54
RESNET50_MULTISTREAM_TARGET_LATENCY=0.67

# Use workload-specific frequency limits.
RUN_CMD_COMMON_SUFFIX_DEFAULT='--vc=17 --sleep_before_ck_benchmark_sec=60'