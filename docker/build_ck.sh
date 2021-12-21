#/bin/bash

#
# Copyright (c) 2021 Krai Ltd.
#
# SPDX-License-Identifier: BSD-3-Clause.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its contributors
# may be used to endorse or promote products derived from this software without
# specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#


if [[ $# < 1 ]]; then
  echo "Please enter the model name to build the Docker image for (one of: bert, resnet50, ssd-resnet34, ssd-mobilenet).";
  exit 1;
fi

MODEL=$1

echo "Building the MLCommons (QAIC independent) Docker image for '${MODEL}'";

_BASE_OS=${BASE_OS:-centos7}
_DOCKER_OS=${DOCKER_OS:-centos7}

if [ ! -z "${NO_CACHE}" ]; then
  _NO_CACHE="--no-cache"
fi

if [[ "$(docker images -q krai/ck.common.${_BASE_OS} 2> /dev/null)" == "" ]]; then
  cd $(ck find ck-qaic:docker:base) && ./build_ck.sh
fi

echo "Creating image: krai/mlperf.${_DOCKER_OS}.${MODEL}"
echo "docker build ${_NO_CACHE} -f Dockerfile.ck -t krai/ck.${MODEL}.${_DOCKER_OS} ."
cd $(ck find ck-qaic:docker:${MODEL}) && docker build ${_NO_CACHE} -f Dockerfile.ck -t krai/ck.${MODEL}.${_DOCKER_OS} .

echo
echo "Done."