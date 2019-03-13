#!/bin/bash
# Example S2I run script, sourced from
# https://docs.openshift.com/container-platform/3.9/creating_images/s2i.html#s2i-scripts

pushd ${HOME}
if [ -d deps ]; then
    # all deps contents to tar stream
    tar cf - deps
fi
popd
