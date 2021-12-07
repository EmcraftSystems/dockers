# Build docker, passing current uid and gid and SSH keys to the docker image.

if [ ! -f yocto-docker/mcuxpressoide-tools-11.0.1.201907311258.tar.bz2 ]; then
    echo "Please download mcuxpressoide-tools-11.0.1.201907311258.tar.bz2 to yocto/docker/"
    exit -1
fi

docker build -t lgo-docker:0.1 yocto-docker --build-arg UID="$(id -u)" --build-arg GID="$(id -g)"  --build-arg ssh_prv_key="$(cat ~/.ssh/id_rsa)" --build-arg ssh_pub_key="$(cat ~/.ssh/id_rsa.pub)" 
