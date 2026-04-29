#!/bin/bash
VERSION="1.0"

# Colors
RED="\033[0;31m"
GREEN="\033[0;32m"
BLUE="\033[0;36m"
GRAY="\033[0;37m"
WHITE="\033[97m"
NOCOLOR="\033[0m"

# Sign
echo -e ""
echo -e "${GRAY}ipchecker - a simple utility for checking server IP info"
echo -e "${GRAY}please star the repo on github. thanks"
echo -e "${GRAY}script version: ${WHITE}${VERSION}"

# Grab info
ipv4=$(curl -s -4 --max-time 5 ifconfig.me 2>/dev/null)
ipv6=$(curl -s -6 --max-time 5 ifconfig.me 2>/dev/null)
data=$(curl -s ipinfo.io)

country=$(echo "$data" | jq -r '.country')
city=$(echo "$data" | jq -r '.city')
timezone=$(echo "$data" | jq -r '.timezone')
asn=$(echo "$data" | jq -r '.org')

# IPv4
echo -e ""
if [[ -n "$ipv4" ]]; then
    echo -e "${GRAY}IPv4: ${WHITE}$ipv4 ${GRAY}| ${GREEN}Supported"
else
    echo -e "${GRAY}IPv4: ${RED}Unsupported"
fi

# IPv6
if [[ -n "$ipv6" ]]; then
    echo -e "${GRAY}IPv6: ${WHITE}$ipv6 ${GRAY}| ${GREEN}Supported"
else
    echo -e "${GRAY}IPv6: ${RED}Unsupported"
fi

# Other
echo -e "${GRAY}Country: ${WHITE}$country"
echo -e "${GRAY}City: ${WHITE}$city"
echo -e "${GRAY}Timezone: ${WHITE}$timezone"
echo -e "${GRAY}ASN: ${WHITE}$asn"
echo -e ""