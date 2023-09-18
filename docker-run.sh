# Work directory, will be mapped to /work on docker, for example
WORKDIR=/work/psl/IMX8M/work/RM5990-docker/work-docker



if [ -z "${WORKDIR}" ]; then
    echo "WORKDIR is not set, exit"
    exit -1
fi

docker run -i -t  --security-opt "label=disable" \
       -v ${WORKDIR}:/work \
       --env="DISPLAY" \
       ubuntu16-6sx:latest
