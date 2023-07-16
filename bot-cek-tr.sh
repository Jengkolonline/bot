#!/bin/bash
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'
blue='\033[0;34m'
ungu='\033[0;35m'
Green="\033[32m"
Red="\033[31m"
WhiteB="\e[5;37m"
BlueCyan="\e[5;36m"
MYIP=$(wget -qO- ipv4.icanhazip.com)
Green_background="\033[42;37m"
Red_background="\033[41;37m"
Suffix="\033[0m"
NC='\e[0m'
timenow=$(date +%T)
function convert() {
    local -i bytes=$1
    if [[ $bytes -lt 1024 ]]; then
        echo "${bytes}B"
    elif [[ $bytes -lt 1048576 ]]; then
        echo "$(((bytes + 1023) / 1024))KB"
    elif [[ $bytes -lt 1073741824 ]]; then
        echo "$(((bytes + 1048575) / 1048576))MB"
    else
        echo "$(((bytes + 1073741823) / 1073741824))GB"
    fi
}
tim2sec() {
    mult=1
    arg="$1"
    res=0
    while [ ${#arg} -gt 0 ]; do
        prev="${arg%:*}"
        if [ "$prev" = "$arg" ]; then
            curr="${arg#0}"
            prev=""
        else
            curr="${arg##*:}"
            curr="${curr#0}"
        fi
        curr="${curr%%.*}"
        res=$((res + curr * mult))
        mult=$((mult * 60))
        arg="$prev"
    done
    echo "$res"
}
echo -e "**◇━━━━━━━━━━━━━━━━━◇**"
marimakan=($(cat /etc/trojan/.trojan.db | grep '^###' | cut -d ' ' -f 2 | sort | uniq))
echo -n >/tmp/rotate
for db in ${marimakan[@]}; do
    logFile=$(cat /var/log/xray/access.log | grep -w "email: ${db}" | tail -n 150)
    while read a; do
        if [[ -n ${a} ]]; then
            set -- ${a}
            my="${7}"
            res="${2}"
            makansate="${3}"
            ult=$(echo "${makansate}" | sed 's/tcp://g' | sed '/^$/d' | cut -d. -f1,2,3)
            now=$(tim2sec ${timenow})
            sateeeee=$(tim2sec ${res})
            nowt=$(((${now} - ${sateeeee})))
            if [[ ${nowt} -lt 40 ]]; then
                cat /tmp/rotate | grep -w "${my}" | grep -w "${ult}" >/dev/null
                if [[ $? -eq 1 ]]; then
                    echo "${my} ${res} ${ult}" >>/tmp/rotate
                    split=$(cat /tmp/rotate)
                fi
            fi
        fi
    done <<<"${logFile}"
done
if [[ ${split} != "" ]]; then
    for user in ${marimakan[@]}; do
        result=$(cat /tmp/rotate | grep -w "${user}" | wc -l)
        if [[ ${result} -gt 0 ]]; then
            if [[ -e /etc/limit/trojan/${user} ]]; then
                byt=$(cat /etc/limit/trojan/${user})
                gb=$(convert ${byt})
            else
                gb=""
            fi
            if [[ -e /etc/trojan/${user} ]]; then
                byte=$(cat /etc/trojan/${user})
                lim=$(convert ${byte})
                echo -e "**Account   :** $user"
                echo -e "**Usage     :** ${gb}"
                echo -e "**Limit     :** ${lim}"
                echo -e "**IP Login  :** ${result}"
                echo -e "**◇━━━━━━━━━━━━━━━━━◇**"
            fi
        fi
    done
fi
echo ""
