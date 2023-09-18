# Container image to build Emcraft 6ull and 6solox BSPs packages and toolchain.
FROM ubuntu:16.04
RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat
RUN apt install -y python python3 emacs doxygen bc u-boot-tools mtd-utils curl sudo cpio lzop
RUN apt install --reinstall locales

RUN git clone --depth=1 https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git /lib/firmware/

# Install Google repo utility
RUN curl https://storage.googleapis.com/git-repo-downloads/repo-1 > /usr/local/bin/repo
RUN chmod 755 /usr/local/bin/repo



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

# workdir, mapped to a workdir on the host
RUN mkdir -p /work
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

RUN chown -R dev:dev /home/dev/

USER dev
WORKDIR /home/dev/
