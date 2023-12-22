#!/bin/bash

# Define variables for VM name, memory, and disk size
VM_NAME="WindowsServer2019"
MEMORY=4096  # 4 GB RAM
DISK_SIZE=40000  # 40 GB HDD

# Download the Windows Server 2019 ISO if needed
ISO_URL="https://download.microsoft.com/download/9/6/8/968A3696-8A5E-40A1-8F0A-8071BF063612/17763.379.190312-0539.rs5_release_svc_refresh_SERVER_EVAL_x64FRE_en-us_1.iso"
ISO_FILE="WindowsServer2019.iso"

if [ ! -f $ISO_FILE ]; then
    echo "Downloading Windows Server 2019 ISO..."
    wget -O $ISO_FILE $ISO_URL
fi

# Create the VM
VBoxManage createvm --name $VM_NAME --ostype Windows2019_64 --register

# Configure VM settings
VBoxManage modifyvm $VM_NAME --memory $MEMORY --vram 128
VBoxManage createhd --filename "$VM_NAME.vdi" --size $DISK_SIZE
VBoxManage storagectl $VM_NAME --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach $VM_NAME --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$VM_NAME.vdi"
VBoxManage storageattach $VM_NAME --storagectl "SATA Controller" --port 1 --device 0 --type dvddrive --medium $ISO_FILE

# Start the VM and begin installation
VBoxManage startvm $VM_NAME --type gui
