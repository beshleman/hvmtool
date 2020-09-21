#!/bin/bash

uuid=$(cat .hvmtool-vm-uuid)

varstore-ls ${uuid} | while read -r line
do
    var_name=$(echo $line | cut -d ' ' -f 2)
    var_guid=$(echo $line | cut -d ' ' -f 1)
    var_data=$(varstore-get ${uuid} ${var_guid} ${var_name})
    echo "================================="
    echo "Variable: $var_name"
    echo "Guid    : $var_guid"
    echo "Data:"
    echo $var_data | hexdump
    echo "================================="
done
