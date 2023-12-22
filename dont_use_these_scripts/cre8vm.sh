#!/bin/bash 

# Function to prompt user for input with a default value and validate
prompt() {
  local prompt_message="$1"
  local default_value="$2"
  local user_input

  while true; do
    echo -n "$prompt_message [$default_value]: "
    read user_input

    # If the input is empty, use the default value
    if [ -z "$user_input" ]; then
      user_input="$default_value"
    fi

    # Validate specific inputs
    case "$prompt_message" in
      "Enter VM name")
        if [[ "$user_input" =~ ^[a-zA-Z0-9_]+$ ]]; then
          echo "$user_input"
          break
        else
          echo "Invalid VM name. Use only letters, numbers, and underscores."
        fi
        ;;
      "Enter memory size (in MB)")
        if [[ "$user_input" =~ ^[0-9]+$ ]] && [ "$user_input" -gt 0 ]; then
          echo "$user_input"
          break
        else
          echo "Invalid memory size. Please enter a positive integer."
        fi
        ;;
      "Enter the number of CPU cores")
        if [[ "$user_input" =~ ^[0-9]+$ ]] && [ "$user_input" -gt 0 ]; then
          echo "$user_input"
          break
        else
          echo "Invalid CPU core count. Please enter a positive integer."
        fi
        ;;
      "Enter disk size (in MB)")
        if [[ "$user_input" =~ ^[0-9]+$ ]] && [ "$user_input" -gt 0 ]; then
          echo "$user_input"
          break
        else
          echo "Invalid disk size. Please enter a positive integer."
        fi
        ;;
      *)
        echo "$user_input"
        break
        ;;
    esac
  done
}

# Function to browse and select a file using zenity
browse_file() {
  local dialog_title="$1"
  local file
  file=$(zenity --file-selection --title="$dialog_title" 2>/dev/null)
  echo "$file"
}

# Function for error handling
handle_error() {
  local error_message="$1"
  echo "Error: $error_message"
  exit 1
}

# Prompt the user for VM configuration
VM_NAME=$(prompt "Enter VM name" "WindowsServerVM")
ISO_PATH=$(browse_file "Select Windows Server 2019 ISO file" "/path/to/your/WindowsServer2019.iso")
MEMORY_SIZE=$(prompt "Enter memory size (in MB)" "4096")
CPU_CORES=$(prompt "Enter the number of CPU cores" "2")
DISK_SIZE=$(prompt "Enter disk size (in MB)" "20000")

# Validate ISO file path
if [ ! -f "$ISO_PATH" ]; then
  handle_error "Invalid ISO file path: $ISO_PATH"
fi

# Display the configured values and ask for confirmation
echo "VM Configuration:"
echo "Name: $VM_NAME"
echo "ISO Path: $ISO_PATH"
echo "Memory Size: $MEMORY_SIZE MB"
echo "CPU Cores: $CPU_CORES"
echo "Disk Size: $DISK_SIZE MB"

read -p "Is this configuration correct? (yes/no): " confirmation
if [ "$confirmation" != "yes" ]; then
  echo "VM creation aborted."
  exit 1
fi

# Create the VM
VBoxManage createvm --name "$VM_NAME" --ostype "Windows2019_64" --register || handle_error "Failed to create VM"

# Configure VM settings
VBoxManage modifyvm "$VM_NAME" --memory "$MEMORY_SIZE" || handle_error "Failed to configure memory"
VBoxManage modifyvm "$VM_NAME" --cpus "$CPU_CORES" || handle_error "Failed to configure CPU cores"
VBoxManage createhd --filename "$VM_NAME.vdi" --size "$DISK_SIZE" --format VDI || handle_error "Failed to create virtual hard disk"
VBoxManage storagectl "$VM_NAME" --name "SATA Controller" --add sata --controller IntelAHCI || handle_error "Failed to add SATA controller"
VBoxManage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$VM_NAME.vdi" || handle_error "Failed to attach virtual hard disk"
VBoxManage storageattach "$VM_NAME" --storagectl "SATA Controller" --port 1 --device 0 --type dvddrive --medium "$ISO_PATH" || handle_error "Failed to attach ISO file"

# Start the VM
VBoxManage startvm "$VM_NAME" || handle_error "Failed to start VM"