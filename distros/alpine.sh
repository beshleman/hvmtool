#!/bin/bash

hvmtool/hvmtool-build /var/opt/xen/iso_import/alpine-virt-3.11.5-x86_64.iso 
hvmtool/hvmtool-start --console
hvmtool/hvmtool-stop --uninstall
