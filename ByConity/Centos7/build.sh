#!/usr/bin/env bash
set -e

mkdir -p /server/build_docker_centos
cd /server/build_docker_centos

cmake ../ -G Ninja "-DCMAKE_C_COMPILER=$(command -v clang-11)" "-DCMAKE_CXX_COMPILER=$(command -v clang++)" "-DGCC_TOOLCHAIN=${GCC_TOOLCHAIN}" "-DCMAKE_BUILD_TYPE=${BUILD_TYPE}"

NUM_JOBS=$(( ($(nproc || grep -c ^processor /proc/cpuinfo) + 1) / 2 ))
ninja -j $NUM_JOBS
