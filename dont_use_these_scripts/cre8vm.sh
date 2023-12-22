import subprocess
from pathlib import Path

def prompt_user(prompt_message, default_value):
    while True:
        user_input = input(f"{prompt_message} [{default_value}]: ").strip()

        # If the input is empty, use the default value
        if not user_input:
            user_input = default_value

        # Validate specific inputs
        if "VM name" in prompt_message and not user_input.isalnum():
            print("Invalid VM name. Use only letters, numbers, and underscores.")
        elif "RAM size" in prompt_message and (not user_input.isdigit() or int(user_input) <= 0):
            print("Invalid RAM size. Please enter a positive integer.")
        elif "CPU cores" in prompt_message and (not user_input.isdigit() or int(user_input) <= 0):
            print("Invalid CPU core count. Please enter a positive integer.")
        elif "hard disk size" in prompt_message and (not user_input.isdigit() or int(user_input) <= 0):
            print("Invalid hard disk size. Please enter a positive integer.")
        else:
            return user_input

def select_os_type():
    os_types = {
        "Microsoft": [
            "Windows 11",
            "Windows 10",
            "Windows 8.1",
            "Windows 8",
            "Windows 7",
            "Windows Server 2022",
            "Windows Server 2019",
            "Windows Server 2016",
            "Windows Server 2012 R2",
            "Windows Server 2012",
            "Other (Older Windows versions may work with potential limitations)"
        ],
        "Linux": [
            "Ubuntu",
            "Debian",
            "Fedora",
            "CentOS",
            "Red Hat Enterprise Linux",
            "Kali Linux",
            "OpenSUSE",
            "Arch Linux",
            "Other (Many other Linux distributions)"
        ],
        "Other": [
            "Solaris",
            "FreeBSD",
            "OpenBSD",
            "NetBSD",
            "Haiku"
        ]
    }

    while True:
        print("Available operating system types:")
        for i, os in enumerate(os_types.keys(), start=1):
            print(f"{i}. {os}")
        
        choice = input("Select the operating system type (e.g., '1' for 'Microsoft'): ").strip()
        
        if choice.isdigit() and 1 <= int(choice) <= len(os_types):
            selected_os = list(os_types.keys())[int(choice) - 1]
            return selected_os, os_types[selected_os]
        else:
            print("Invalid choice. Please select a valid option.")

def select_os_version(os_versions):
    while True:
        print("Available operating system versions:")
        for i, os in enumerate(os_versions, start=1):
            print(f"{i}. {os}")
        
        choice = input("Select the operating system version (e.g., '1' for 'Windows 11'): ").strip()
        
        if choice.isdigit() and 1 <= int(choice) <= len(os_versions):
            return os_versions[int(choice) - 1]
        else:
            print("Invalid choice. Please select a valid option.")

# Function to use zenity for file selection
def browse_file(dialog_title):
    file_path = subprocess.run(["zenity", "--file-selection", "--title", dialog_title], stdout=subprocess.PIPE, text=True)
    return file_path.stdout.strip()

def launch_vm_prompt():
    while True:
        choice = input("Launch the VM automatically after creation? (yes/no): ").strip().lower()
        if choice in ["yes", "no"]:
            return choice
        else:
            print("Invalid choice. Please enter 'yes' or 'no'.")

# Prompt the user for VM configuration
VM_NAME = prompt_user("Enter VM name", "MyVM")
os_type, os_versions = select_os_type()
selected_os_version = select_os_version(os_versions)
ISO_PATH = browse_file("Select ISO file")

# Validate ISO file path
if not Path(ISO_PATH).is_file():
    print(f"Error: Invalid ISO file path: {ISO_PATH}")
    exit(1)

MEMORY_SIZE = prompt_user("Enter RAM size (in MB)", "2048")
CPU_CORES = prompt_user("Enter the number of CPU cores", "2")
DISK_SIZE = prompt_user("Enter hard disk size (in MB)", "20000")

# Create the VM with the specified OS type
subprocess.run(["VBoxManage", "createvm", "--name", VM_NAME, "--ostype", selected_os_version, "--register"])

# Set display video memory to the maximum (128MB)
subprocess.run(["VBoxManage", "modifyvm", VM_NAME, "--vram", "128"])

# Configure VM settings (same as before)
subprocess.run(["VBoxManage", "modifyvm", VM_NAME, "--memory", MEMORY_SIZE])
subprocess.run(["VBoxManage", "modifyvm", VM_NAME, "--cpus", CPU_CORES])
subprocess.run(["VBoxManage", "createhd", "--filename", f"{VM_NAME}.vdi", "--size", DISK_SIZE, "--format", "VDI"])
subprocess.run(["VBoxManage", "storagectl", VM_NAME, "--name", "SATA Controller", "--add", "sata", "--controller", "IntelAHCI"])
subprocess.run(["VBoxManage", "storageattach", VM_NAME, "--storagectl", "SATA Controller", "--port", "0", "--device", "0", "--type", "hdd", "--medium", f"{VM_NAME}.vdi"])
subprocess.run(["VBoxManage", "storageattach", VM_NAME, "--storagectl", "SATA Controller", "--port", "1", "--device", "0", "--type", "dvddrive", "--medium", ISO_PATH])

launch_choice = launch_vm_prompt()
if launch_choice == "yes":
    subprocess.run(["VBoxManage", "startvm", VM_NAME])
    print(f"VM '{VM_NAME}' has been created and started.")
else:
    print(f"VM '{VM_NAME}' has been created. You can start it manually from VirtualBox.")
