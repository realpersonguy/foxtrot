get_mac_address () {

    ip_address="$( ping -c 1 "$1" | perl -n -e'/PING .*? \((.*?)\).*/ && print $1' )"
    mac_address="$( arp -a | perl -n -e'/' )"

}

