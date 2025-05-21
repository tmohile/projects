#!/bin/bash

pkeyexist()
{
	while [ $? -ne 0 ] ;
	do
		cmd
	done <<< $(ls $HOMEDIR/.ssh/id_rsa > /dev/null 2>&1)
	#if [ $? -eq 0 ] ; then
		printf '%s/.ssh/id_rsa.pub will be copied to destination server.\n' "$HOMEDIR"
	#else
        #        printf '~/.ssh/id_rsa.pub will be copied to destination server.\n'
	#fi
	#printf 'Debug5: pkeyexist finished!\n'
}

pkeycopy()
{
	#printf 'Debug6: pkeycopy executing!\n'
	ssh-copy-id -i $HOMEDIR/.ssh/id_rsa.pub  -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null $1@$2
	printf 'Public key authorized for %s@%s successfully!\n' "$1" "$2"
}

cmd()
{
	ssh-keygen -q -t rsa -N '' -f $HOMEDIR/.ssh/id_rsa <<<y 2>&1 >/dev/null
	printf 'Debug: cmd function executed\n'
}


err()
{
	printf 'Invalid entry.. Exiting!\n'
	exit 1
}

help_()
{
	printf '\nThis script attempts to automate generate and copy of SSH Private/Public Key pair.\n'
	printf 'Ensure you are logged in as the user for which you intend to copy Public key.\n'
	printf '\nUsage: ./pkeylogin.sh [option] [<server>]\n'
	printf 'option: "-h" : Displays this help information.\n'
	printf '	"-d" : Enable debug mode. Should be enabled with -y option.\n'
	printf '	"-y" <server> : YES to all questions and server IP is mandatory.\n'
	printf 'This is the fastest and best, if you know what you are doing!\n'
	printf 'e.g: ./pkeylogin.sh -y 192.168.1.1 ; ./pkeylogin.sh -h ; ./pkeylogin.sh -d -y 192.168.1.1\n\n'
	exit 0
	#printf '\nKey will be copied for user "%s", key file (if it does not exist it will be created):  %s/.ssh/id_rsa.pub\n' "$1" "$HOMEDIR"
}

############# Main block #############
# Usage: ./pkeylogin.sh -y <server_IP>
ip_valid=2
while getopts "dhy:" flag; do
    #echo "flag -$flag, Argument $OPTARG";
    case $flag in
	"d") debug="y"	;;
	"h") help_ ;;
	"y") s_ip=${OPTARG}
	      if [[ "$s_ip" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]] ; then
		ip="$s_ip"
		OIFS=$IFS
        	IFS='.'
        	ip=($ip)
        	IFS=$OIFS
        	[[ ${ip[0]} -le 255 && ${ip[1]} -le 255 \
            	&& ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
        	if [[ $? -eq 0 ]]; then 
			server="$s_ip"
			ip_valid=1
		else 
			ip_valid=0
			printf 'Option -%s requires valid IP address as argument, %s not valid IP address.\n' "${OPTARG}" "$s_ip"
			exit 1
		fi
    	      fi ;;
	  :) printf 'Option -%s requires an argument.\n' "${OPTARG}"
      	     exit 1 ;;
	  ?) printf 'Unknown option - %s. Help will be shown!\n' "$flag"
	      help_ 
	      exit 1 ;;
    esac
done
#uname=$(whoami)
if [[ "$debug" == "y" ]] ; then
printf 'DEBUG 1 : Currently executing pkeylogin.sh %s %s\n' "$1" "$2"
fi
#printf 'User detected [%s]\n' "$(whoami)"
#read uname
uname=${uname:-$(whoami)}
if [[ "$uname" == "$(whoami)" ]] ; then
HOMEDIR="$(echo $HOME)"
#printf 'Home Directory for detected user "%s"' "$HOMEDIR"
printf '\nKey will be copied for user "%s", key file (if it does not exist it will be created):  %s/.ssh/id_rsa.pub\n' "$uname" "$HOMEDIR"
if [[ $ip_valid -eq 1  ]] ; then
	if [[ "$debug" == "y" ]] ; then
	printf 'Debug4: About to execute functions pkeyexist & pkeycopy for %s, %s\n' "$uname" "$server"
	fi
	pkeyexist
	pkeycopy "$uname" "$server"
fi
fi
