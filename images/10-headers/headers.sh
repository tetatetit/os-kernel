#!/bin/bash
set -e
set -x

echo "Kernel headers for ${KERNEL_VERSION}"

DIR=/lib/modules/${KERNEL_VERSION}/build
STAMP=/lib/modules/${KERNEL_VERSION}/.headers-done

if [ -e $STAMP ]; then
    echo Kernel headers for ${KERNEL_VERSION} already installed. Delete $STAMP to reinstall
    exit 0
fi

rm -rf $DIR
mkdir -p $DIR

cat /build.tar.gz | gzip -dc | tar xf - -C $DIR
touch $STAMP

echo Kernel headers for ${KERNEL_VERSION} installed. Delete $STAMP to reinstall
