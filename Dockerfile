FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive

# Set timezone for OS in container
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Clean and update source
RUN apt-get -y clean && apt-get -y update

# Install dependencies and things
RUN apt-get -y install \
	wget \
	git \
	gcc \
	flex \
	bison \
	gperf \
	make \
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
	python-is-python3 \
	2to3 \
	python3-dev \
	python-dev-is-python3 \
	universal-ctags \
	exuberant-ctags \
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

# install FDT PIP package
RUN pip3 install --break-system-packages fdt

# install Micro Text Editor
RUN wget -O- https://getmic.ro | bash \
	&& mv micro /usr/bin

# Create workspace
RUN mkdir -p /root/workspace
WORKDIR /root

COPY support .
RUN ./setup-toolchain.sh
RUN cat setup-env.sh >> .bashrc

VOLUME /root/workspace
WORKDIR /root/workspace

CMD ["/bin/bash"]
