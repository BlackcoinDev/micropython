#!/bin/sh

UNWANTED_SUBMODULES="asf4 axtls berkeley-db-1.xx btstack \
    libffi lwip mbedtls mynewt-nimble nrfx nxp_driver tinyusb"

cd $(dirname $0)

for SUBMODULE in $UNWANTED_SUBMODULES; do
    git submodule deinit -f -- ./$SUBMODULE
    rm -rf ../.git/modules/lib/$SUBMODULE
    git rm -f ./$SUBMODULE
done
