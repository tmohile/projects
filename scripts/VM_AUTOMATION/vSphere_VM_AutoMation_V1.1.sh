#!/bin/bash
declare -a VM_LIST
declare -a SYS_VMs
# ======== CONFIGURE vCenter Connection ========
export GOVC_URL='https://cs-india-vcenter.cs.local'
export GOVC_USERNAME='administrator@vsphere.local'
export GOVC_PASSWORD='Bagabu1984!@#$'
export GOVC_INSECURE=true  # if self-signed cert

# ======== Get all powered-on VMs ========
whiling()
{
present=()
while read line
do
	present+=("$line")
done <<< "$1"
}
## ====== MAIN BLOCK ======
echo "[INFO] Fetching powered-on VMs..."
input=$(govc find / -type m -runtime.powerState poweredOn | grep "CS_folder"); whiling "$input"; VM_LIST=("${present[@]}"); input()
input=$(govc find / -type m -runtime.powerState poweredOn | grep -v "CS_folder"); whiling "$input"; SYS_VMs=("${present[@]}"); input()
if [[ -z "$VM_LIST" && -z "$SYS_VMs"]]; then
    echo "[INFO] No powered-on VMs found."
    exit 0
else
	echo "${#VM_LIST[@]} - powered on VM's found in CS_folder."
	echo "${#SYS_VMs[@]} - Powered on System VM's ."
fi
if [[ ! -z "$1" && "$1" = "-d" ]] ; then
        echo "${input[@]}"
elif [[ ! -z "$1" && "$1" = "-vm" && ! -z "$2" ]] ; then
        VM_NAME=$(basename "$2")
        echo "$VM_NAME VM will be attempted to power OFF."
if [[ "$VM_NAME" = "all" ]] ; then
   for VM in "${VM_LIST[@]}"; do
    VM_NAME=$(basename "$VM")
    echo "[INFO] Attempting graceful shutdown of VM: $VM_NAME"

    # Try graceful shutdown
    # govc vm.shutdown -vm "$VM_NAME"
    sleep 1  # Wait before checking status

    # Check if it's still powered on
    POWER_STATE=$(govc find / -type m -runtime.powerState poweredOff | grep "$VM_NAME")

    if [[ "$(echo $?)" = 1 ]]; then
        echo "[WARN] Graceful shutdown failed or timed out for $VM_NAME. Forcing power off."
        # govc vm.power -off -vm "$VM_NAME"
    else
        echo "[OK] $VM_NAME shut down gracefully."
    fi
    echo "---------------------------------------------"
   done
else
	echo "[INFO] Attempting graceful shutdown of VM: $VM_NAME"
	# Try graceful shutdown
	govc vm.power -s=true "$VM_NAME"
	#sleep 10  # Wait before checking status
	# Check if it's still powered on
	count=0
	while [[ "$(govc vm.info "$VM_NAME" | grep "Power state:" | awk '{print $3}')" = "poweredOn" ]] 
	do
		count=$((count+1))
	printf '.%s' "$count"
	sleep 1
	done
	printf '\n'
	if [[ "$(echo $?)" = 1 ]]; then
		echo "[WARN] Graceful shutdown failed or timed out for $VM_NAME. Forcing power off."
		govc vm.power -off=true "$VM_NAME"
	else
		echo "[OK] $VM_NAME shut down gracefully in $count seconds."
	fi
fi
fi
