#!/bin/bash

# RetinaNet.
RETINANET_SINGLESTREAM_TARGET_LATENCY=24
RETINANET_MULTISTREAM_TARGET_LATENCY=60
RETINANET_OFFLINE_TARGET_QPS=640

# Use workload-specific frequency limits.
RUN_CMD_COMMON_SUFFIX_DEFAULT='--vc=17 --sleep_before_ck_benchmark_sec=60'
