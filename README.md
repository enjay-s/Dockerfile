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
         RPM_DIR=/root/rpmbuild/RPMS/x86_64
         RPM_NAME=Byconity-1-0.x86_64.rpm
```

```shell
[root@olap ~]# docker exec -it byconity_x /bin/bash 
[root@olap /]# cd /usr/bin/
[root@olap bin]# ll |grep clickhouse
-rwxr-xr-x   1 root root    822M Dec  4 20:18 clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 clickhouse-benchmark -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 clickhouse-client -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 clickhouse-compressor -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 clickhouse-copier -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 clickhouse-dumper -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 clickhouse-extract-from-config -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 clickhouse-format -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 clickhouse-git-import -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 clickhouse-keeper -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 clickhouse-keeper-converter -> clickhouse
-rwxr-xr-x   1 root root    247M Dec  4 20:18 clickhouse-library-bridge
lrwxrwxrwx   1 root root      10 Dec  4 20:22 clickhouse-local -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 clickhouse-meta-inspector -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 clickhouse-obfuscator -> clickhouse
-rwxr-xr-x   1 root root    248M Dec  4 20:18 clickhouse-odbc-bridge
lrwxrwxrwx   1 root root      10 Dec  4 20:22 clickhouse-part-toolkit -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 clickhouse-schema-advisor -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 clickhouse-server -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 clickhouse-storage-tools -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 clickhouse-storage_tools -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 clickhouse-worker -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 daemon-manager -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 daemon_manager -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 resource-manager -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 resource_manager -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 tso-server -> clickhouse
lrwxrwxrwx   1 root root      10 Dec  4 20:22 tso_server -> clickhouse
[root@olap bin]# ls /etc/systemd/system/
byconity-daemon.service     byconity-server.service     byconity-worker.service     default.target.wants/       multi-user.target.wants/    
byconity-resource.service   byconity-tso.service        default.target              getty.target.wants/         system-update.target.wants/ 
[root@olap bin]# ls /etc/systemd/system/^C
[root@olap bin]# ls /etc/byconity/
byconity-daemon-manager.xml    byconity-server.xml            byconity-worker-write.xml      cnch_config.xml                embedded.xml                   
byconity-resource-manager.xml  byconity-tso.xml               byconity-worker.xml            config.xml                     users.xml 
```
