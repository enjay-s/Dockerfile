UID := $(shell id -u)
GID := $(shell id -g)

tools:
	echo "tools start"
	test -d tools || mkdir tools
	test -f tools/foundationdb-clients-7.1.27-1.el7.x86_64.rpm || curl -L -o tools/foundationdb-clients-7.1.27-1.el7.x86_64.rpm \
https://github.com/apple/foundationdb/releases/download/7.1.27/foundationdb-clients-7.1.27-1.el7.x86_64.rpm
	test -f tools/cmake-3.25.3-linux-x86_64.sh || curl -L -o tools/cmake-3.25.3-linux-x86_64.sh \
https://github.com/Kitware/CMake/releases/download/v3.25.3/cmake-3.25.3-linux-x86_64.sh || chmod a+x tools/cmake-3.25.3-linux-x86_64.sh
	test -f tools/ninja-linux.zip || curl -L -o tools/ninja-linux.zip \
https://github.com/ninja-build/ninja/releases/download/v1.11.1/ninja-linux.zip
	test -f tools/llvm-11.1.0.src.tar.xz || curl -L -o tools/llvm-11.1.0.src.tar.xz \
https://github.com/llvm/llvm-project/releases/download/llvmorg-11.1.0/llvm-11.1.0.src.tar.xz
	test -f tools/clang-11.1.0.src.tar.xz || curl -L -o tools/clang-11.1.0.src.tar.xz \
https://github.com/llvm/llvm-project/releases/download/llvmorg-11.1.0/clang-11.1.0.src.tar.xz
	test -f tools/lld-11.1.0.src.tar.xz || curl -L -o tools/lld-11.1.0.src.tar.xz \
https://github.com/llvm/llvm-project/releases/download/llvmorg-11.1.0/lld-11.1.0.src.tar.xz
	test -f tools/compiler-rt-11.1.0.src.tar.xz || curl -L -o tools/compiler-rt-11.1.0.src.tar.xz \
https://github.com/llvm/llvm-project/releases/download/llvmorg-11.1.0/compiler-rt-11.1.0.src.tar.xz
	test -f tools/openssl-1.1.1i.tar.gz || curl -L -o tools/openssl-1.1.1i.tar.gz \
https://www.openssl.org/source/openssl-1.1.1i.tar.gz
	test -f tools/gcc-10.2.0.tar.gz || curl -L -o tools/gcc-10.2.0.tar.gz \
https://ftp.gnu.org/gnu/gcc/gcc-10.2.0/gcc-10.2.0.tar.gz
	#test -f tools/gcc-10.2.0.zip
	echo "tools finish"

base: tools
	echo "base start"
	docker build --network=host -t $(BASE_IMAGE) -f ./Dockerfile_base .
	echo "base finish"

dev: base
	echo "dev start"
	docker build --network=host -t $(DEV_IMAGE) -build-arg BASE_IMAGE=$(BASE_IMAGE)  -f ./Dockerfile_dev  .
	mkdir -p $(HOME)/.ccache
	docker run --name byconity_dev --network=host -p 5901:5901 6001:6001 --user=$(UID):$(GID) --rm --workdir /server \
    --volume $(PROJECT):/server --cap-add=SYS_PTRACE -e CCACHE_DIR=$(HOME)/.ccache -it $(BASE_IMAGE)
	echo "dev finish"

build: base
	echo "build start"
	docker build --network=host -t $(BUILD_IMAGE) -build-arg BASE_IMAGE=$(BASE_IMAGE) BUILD_TYPE=$(BUILD_TYPE) -f ./Dockerfile_build .
	test -d $(PROJECT) || git clone -b jasong_online --recursive https://github.com/ByConity/ByConity.git $(PROJECT)
	mkdir -p $(HOME)/.ccache
	docker run --name byconity_build --network=host --user=$(UID):$(GID) --rm --workdir /server --volume $(PROJECT):/server \
    --cap-add=SYS_PTRACE -e CCACHE_DIR=$(HOME)/.ccache -it $(BASE_IMAGE)
	echo "build finish"

rpm:
	echo "rpm start"
	test -d $(RPM_PROJECT) || git clone https://github.com/enjay-s/build_byconity_rpm.git $(RPM_PROJECT)
    export BYCONITY_BUILD_DIR=$(RPM_PROJECT)/build_docker_centos
	rpmbuild -ba $(RPM_PROJECT)/SPECS/clickhouse.spec
	echo "rpm finish"

deploy: rpm
	echo "deploy start"
	docker build --network=host -t $(DEPLOY_IMAGE) --build-arg BASE_IMAGE=$(BASE_IMAGE) -f ./Dockerfile_deploy .
	echo "deploy finish"

push: deploy
	echo "push start"
	docker push $(DEPLOY_IMAGE)
	echo "push finish"
