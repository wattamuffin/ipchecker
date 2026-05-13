#!/bin/bash
VERSION="2.1"

# Colors
RED="\033[0;31m"
GREEN="\033[0;92m"
BLUE="\033[0;34m"
GRAY="\033[0;37m"
WHITE="\033[97m"
NOCOLOR="\033[0m"

# Grab info
ipv4=$(curl -s -4 --max-time 5 ifconfig.me 2>/dev/null)
data=$(curl -s ipinfo.io)

country=$(echo "$data" | jq -r '.country')
city=$(echo "$data" | jq -r '.city')
timezone=$(echo "$data" | jq -r '.timezone')
asn=$(echo "$data" | jq -r '.org')

# Other
echo -e "${BLUE}██╗██████╗  ██████╗██╗  ██╗██╗  ██╗      \033[0;34mIPv4: ${NOCOLOR}$ipv4"
echo -e "${BLUE}██║██╔══██╗██╔════╝██║  ██║██║ ██╔╝      "
echo -e "${BLUE}██║██████╔╝██║     ███████║█████╔╝       ${BLUE}Country: ${NOCOLOR}$country"
echo -e "${BLUE}██║██╔═══╝ ██║     ██╔══██║██╔═██╗       ${BLUE}City: ${NOCOLOR}$city"
echo -e "${BLUE}██║██║     ╚██████╗██║  ██║██║  ██╗      ${BLUE}Timezone: ${NOCOLOR}$timezone"
echo -e "${BLUE}╚═╝╚═╝      ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝      ${BLUE}ASN: ${NOCOLOR}$asn"