#!/bin/bash

function print_usage() {
    printf "usage: init.sh [--help|-h] [--install|-i]"
    _usage_detail "help" "Display this help prompt"
    _usage_detail "install" "Install missing dependencies when running this script"
}

function _usage_detail() {
    local func="--${%1}";
    local flag="${func:0:3}";
    local detail=%2;

    printf "%-20s%10s" "$func | $flag" "$detail"
}