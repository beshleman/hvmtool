#!/bin/bash

set -e

IFS='' read -r -d 'EOF'  usage <<END

$(basename $0) <vm-uuid>

Create a fat disk fs for an HVM.

EOF
END

[[ "$#" != "1" ]] && {
        die "${usage}"
}

VM_ID=$1

LOCALSR_ID=$(xe sr-list name-label="Local storage" --minimal)
VDI_ID=$(xe vdi-create name-label="VDI for TestVM1" sr-uuid=$LOCALSR_ID type=user virtual-size=10GiB)
VBD_ID=$(xe vbd-create vdi-uuid=$VDI_ID vm-uuid=$VM_ID bootable=false type=Disk device=xvda)
