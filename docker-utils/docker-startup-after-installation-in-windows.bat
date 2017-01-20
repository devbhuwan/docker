::https://docs.docker.com/machine/reference/create/
docker-machine create --virtualbox-disk-size 102400 -d virtualbox default ::100GB disk
docker-machine start default
docker-machine env default
docker-machine ssh default

::docker-machine stop default
::------------------------------------------------------------------------------------------------
:: In Docker SSH Console
::------------------------------------------------------------------------------------------------
export DOCKERSCRIPTS=/home/docker/scripts
mkdir -p $DOCKERSCRIPTS
sudo mount -t vboxsf -o uid=1000,gid=50 docker-scripts $DOCKERSCRIPTS

::sudo mount -t vboxsf -o uid=1000,gid=50 your-shared-folder-name /existing/location/in/docker/VM
::***************two main folders*******************
::/mnt/sda1/var/lib/boot2docker
::/mnt/sda1/var/lib/docker
::------------------------------------------------------------------------------------------------
