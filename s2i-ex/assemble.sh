#!/bin/bash
# Example S2I script from docs.openshift.org
# https://docs.openshift.com/container-platform/3.9/creating_images/s2i.html#s2i-scripts
# restore build artifacts
if [ "$(ls /tmp/s2i/artifacts/ 2>/dev/null)" ]; then
    mv /tmp/s2i/artifacts/* $HOME/.
fi

# move the application source
mv /tmp/s2i/src $HOME/src

# build application artifacts
pushd ${HOME}
make all

# install the artifacts
make install
popd
