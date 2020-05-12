#!/bin/bash

VM_ID=$(hvmtool/hvmtool-build /var/opt/xen/iso_import/alpine-virt-3.11.5-x86_64.iso)
hvmtool/hvmtool-start $VM_ID 0
hvmtool/hvmtool-gdb $VM_ID
sleep 30
yes yes | xe vm-uninstall uuid=$VM_ID
rm /var/run/xen/varstored-db.dat /var/run/xen/varstored-db-var-len.dat
