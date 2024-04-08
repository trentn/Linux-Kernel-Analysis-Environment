
export RELEASE=bullseye
export KERNEL=$(pwd)/kernel
export IMAGE=$(pwd)/images
export VMSCRIPTS=$(pwd)/analysis_scripts
export KCONF_FRAGS=$(pwd)/kernel_options
export PATH=$PATH:$VMSCRIPTS
export WORKSPACE=$(pwd)/shared