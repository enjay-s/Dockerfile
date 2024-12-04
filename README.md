# Docker file

## ByConity Centos7

### 构建编译基础镜像
```shell
make base BASE_IMAGE=byconity_base \
          PROJECT=/data1/songenjie001/ByConity
```

### 构建开发环境
```shell
make dev BASE_IMAGE=byconity_base \
	       DEV_IMAGE=byconity_dev \
	       PROJECT=/data1/songenjie001/ByConity
```

### 编译
```shell
make build BASE_IMAGE=byconity_base \
           BUILD_IMAGE=byconity_build \
           BUILD_TYPE=Rlease \
           PROJECT=/data1/songenjie001/ByConity
```

### 构建RPM
```shell
make rpm BASE_IMAGE=byconity_base \
         BUILD_IMAGE=byconity_build \
         BUILD_TYPE=Rlease \
         PROJECT=/data1/songenjie001/ByConity \
         RPM_PROJECT=/data1/songenjie001/build_byconity_rpm
```

### 构建byconity部署镜像
```shell
make deploy BASE_IMAGE=byconity_base \
         BUILD_IMAGE=byconity_build \
         DEPLOY_IMAGE=byconity_deploy
         BUILD_TYPE=Rlease \
         PROJECT=/data1/songenjie001/ByConity \
         RPM_PROJECT=/data1/songenjie001/build_byconity_rpm
```
