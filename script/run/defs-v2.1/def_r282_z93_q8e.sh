#!/bin/bash

# BERT-99% (mixed precision).
BERT99_OFFLINE_OVERRIDE_BATCH_SIZE=4096
BERT99_SERVER_OVERRIDE_BATCH_SIZE=1024
BERT99_OFFLINE_TARGET_QPS=5598
BERT99_SERVER_TARGET_QPS=5300

# BERT-99.9% (FP16 precision).
BERT999_OFFLINE_OVERRIDE_BATCH_SIZE=4096
BERT999_SERVER_OVERRIDE_BATCH_SIZE=1024
BERT999_OFFLINE_TARGET_QPS=2500
BERT999_SERVER_TARGET_QPS=2100

# ResNet50.
RESNET50_OFFLINE_TARGET_QPS=160000
RESNET50_SERVER_TARGET_QPS=151000
RESNET50_MAX_WAIT=1800

RUN_CMD_COMMON_SUFFIX_DEFAULT="--vc --pre_fan=75 --post_fan=50 --sleep_before_ck_benchmark_sec=120"
#For bert-99: RUN_CMD_COMMON_SUFFIX_DEFAULT="--vc=9 --pre_fan=75 --post_fan=50 --sleep_before_ck_benchmark_sec=120"
