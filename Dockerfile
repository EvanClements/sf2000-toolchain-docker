FROM debian:buster-slim
ENV DEBIAN_FRONTEND noninteractive

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update && apt-get -y install \
	wget \
	git \
	gcc \
	flex \
	bison \
	gperf \
	make \
	python \
	unzip \
	unrar-free \
	dos2unix \
	swig \
	python3 \
 	python-is-python3 \
 	python-dev-is-python3 \
	python3-dev \
	python3-pip \
	clang-format \
	python3-pip \
	python3-setuptools \
	python3-wheel \
	ninja-build \
	rename \
	gdb \
	apache2 \
	re2c \
	universal-ctags \
	lzip \
	libncurses-dev \
	tree \
	pkg-config \
	cmake \
	automake \
	lzop \
	doxygen \
	graphviz \
	libssl-dev \
	genromfs \
	lzma \
	mtools \
	mtd-tools \
	rsync \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/workspace
WORKDIR /root

RUN pip3 install --break-system-packages -y fdt

COPY support .
RUN ./setup-toolchain.sh
RUN cat setup-env.sh >> .bashrc

VOLUME /root/workspace
WORKDIR /root/workspace

CMD ["/bin/bash"]
