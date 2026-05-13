#!/bin/bash
VERSION="2.1"

# Colors
RED='\033[0;31m'
GREEN='\033[0;92m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
WHITE='\033[97m'
NOCOLOR='\033[0m'

# Grab info
ipv4=$(curl -s -4 --max-time 5 ifconfig.me 2>/dev/null)
data=$(curl -s ipinfo.io)

country=$(echo "$data" | jq -r '.country')
city=$(echo "$data" | jq -r '.city')
timezone=$(echo "$data" | jq -r '.timezone')
loc=$(echo "$data" | jq -r '.loc')
asn=$(echo "$data" | jq -r '.org')

# Other
echo -e "${CYAN}██╗██████╗  ██████╗██╗  ██╗██╗  ██╗      IPv4: ${NOCOLOR}$ipv4"
echo -e "${CYAN}██║██╔══██╗██╔════╝██║  ██║██║ ██╔╝      "
echo -e "${CYAN}██║██████╔╝██║     ███████║█████╔╝       Country: ${NOCOLOR}$country"
echo -e "${CYAN}██║██╔═══╝ ██║     ██╔══██║██╔═██╗       City: ${NOCOLOR}$city"
echo -e "${CYAN}██║██║     ╚██████╗██║  ██║██║  ██╗      Timezone: ${NOCOLOR}$timezone"
echo -e "${CYAN}╚═╝╚═╝      ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝      Location: ${NOCOLOR}$loc"
echo -e "                                   ${CYAN}ASN: ${NOCOLOR}$asn"