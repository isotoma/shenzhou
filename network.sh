#!/bin/bash

function define {
    virsh net-destroy $1
    virsh net-define $2
    virsh net-autostart $1
    virsh net-start $1
}


define shenzou network.xml

