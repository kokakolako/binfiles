#!/bin/sh

case $1 in
    2 | 2.7 )
        ~/projekte/python/virt-env/python2/bin/activate
        cd ~/projekte/python/virt-env/python2
    ;;
    3 | 3.3 )
        ~/projekte/python/virt-env/python3/bin/activate
        cd ~/projekte/python/virt-env/python3
    ;;
esac

