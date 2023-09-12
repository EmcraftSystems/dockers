# Container image to build Emcraft 6ull and 6solox BSPs packages and toolchain.
FROM ubuntu:14.04
RUN apt-get update

RUN apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat
RUN apt install -y python emacs doxygen bc u-boot-tools mtd-utils

# Set bash as default shell
RUN echo 'dash dash/sh boolean false' | debconf-set-selections && \
    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

# args, overriden with --build-arg
ARG UID=2000
ARG GID=2000


RUN groupadd -g ${GID} dev
RUN groupadd -g 1001 build
RUN useradd -u ${UID} -g ${GID} -G sudo,build -d /home/dev/ dev
# Create a password for "dev" user, for sudo
RUN echo "dev:dev" | chpasswd

RUN mkdir /home/dev/
RUN mkdir /home/dev/.ssh/
RUN chmod 700 /home/dev/.ssh/
# To avoid bitbake errors
RUN echo "StrictHostKeyChecking=no" > /home/dev/.ssh/config

# workdir, mapped to a workdir on the host
RUN mkdir -p /work
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

RUN chown -R dev:dev /home/dev/

USER dev
WORKDIR /home/dev/
