# Work directory, will be mapped to /work on docker, for example
# WORKDIR=/work/psl/IMX8M/work/RM5990-docker/work-docker
# Where Yocto sstate cache is, could be an empty dir, for example
# SSTATE_DIR=/work/yocto/sstate-cache
# Where Yocto downloads cache is, could be an empty dir, for example
# DL_DIR=/work/yocto/Downloads


if [ -z "${WORKDIR}" ] || [ -z "$SSTATE_DIR" ] || [ -z "${DL_DIR}" ]; then
    echo "Set SSTATE_DIR, WORKDIR and DL_DIR"
    exit -1
fi

docker run --rm -i -t --name mydocker 	--security-opt "label=disable" \
       -v ${WORKDIR}:/work \
       -v ${WORKDIR}/opt:/opt:z \
       -v ${SSTATE_DIR}:/opt/yocto/sstate-cache:z \
       -v ${DL_DIR}:/opt/yocto/downloads:z \
       --env="DISPLAY" \
       lgo-docker:0.1
