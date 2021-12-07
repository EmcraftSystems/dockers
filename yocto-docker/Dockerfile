FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping libbz2-dev libz-dev locales cmake sudo emacs vim bc \
     curl
# Set bash as default shell
RUN echo 'dash dash/sh boolean false' | debconf-set-selections && \
    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash

# Additional packages for static code analisys (create_report.sh)

RUN apt-get install -y libjpeg-dev curl apt-utils cppcheck libgtk-3-dev libgtk2.0-dev \
    libglw1-mesa libglw1-mesa-dev freeglut3-dev mesa-common-dev \
    python3-dev	 \
    python3-venv \
    clang-format \
    cppcheck	 \
    lcov	 \
    libsystemd-dev \
    libzmq3-dev	   \
    valgrind	   \
    libeigen3-dev  \
    libsqlite3-dev sqlite3 \
    libcanberra-gtk-module \
    imagemagick-6.q16


# args, overriden with --build-arg
ARG UID=2000
ARG GID=2000
ARG ssh_prv_key
ARG ssh_pub_key


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
RUN mkdir /work/

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

# Add the keys and set permissions
RUN echo "$ssh_prv_key" > /home/dev/.ssh/id_rsa && \
    echo "$ssh_pub_key" > /home/dev/.ssh/id_rsa.pub && \
    chmod 600 /home/dev/.ssh/id_rsa && \
    chmod 600 /home/dev/.ssh/id_rsa.pub

RUN chown -R dev:dev /home/dev/

# Install tools for rt_core
COPY mcuxpressoide-tools-11.0.1.201907311258.tar.bz2 /
RUN tar xfj mcuxpressoide-tools-11.0.1.201907311258.tar.bz2
RUN rm -f mcuxpressoide-tools-11.0.1.201907311258.tar.bz2
USER dev
WORKDIR /home/dev/
