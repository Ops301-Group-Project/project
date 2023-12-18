# Function to display existing input with option to edit
function ShowAndEditInput($variableName) {
  if ([PSCustomObject]::ContainsKey($PSBoundParameters, $variableName)) {
    $existingValue = ${$variableName}
    Write-Host "Current value for $variableName: $existingValue"
    Write-Host "Press Enter to keep, or type your new value and press Enter:"
    $newValue = Read-Host ""
    if ($newValue) {
      ${$variableName} = $newValue
      Write-Host "Value updated."
    }
  }
}

# Initialize empty variables
$VMName = ""
$ISOpath = ""
$Generation = ""
$MemoryStartupBytes = ""
$ProcessorCount = ""
$VHDPath = ""
$NetworkAdapterName = ""
$Username = ""
$Password = ""

# Main program loop
while (!$VMName) {
  Write-Host "Enter the name for the virtual machine:"
  $VMName = Read-Host ""
  ShowAndEditInput "VMName"
}

while (!$ISOpath) {
  Write-Host "Enter the path to the Windows 10 ISO image:"
  $ISOpath = Read-Host ""
  ShowAndEditInput "ISOpath"
}

while (-not ([int]$Generation -like "2|3")) {
  Write-Host "Enter the virtual machine generation (2 or 3):"
  $Generation = Read-Host ""
  ShowAndEditInput "Generation"
}

while (-not ([int]$MemoryStartupBytes -ge 1024)) {
  Write-Host "Enter the RAM allocated to the VM (in MB, minimum 1024):"
  $MemoryStartupBytes = Read-Host ""
  ShowAndEditInput "MemoryStartupBytes"
}

while (-not ([int]$ProcessorCount -ge 1)) {
  Write-Host "Enter the number of CPU cores for the VM (minimum 1):"
  $ProcessorCount = Read-Host ""
  ShowAndEditInput "ProcessorCount"
}

while (!$VHDPath) {
  Write-Host "Enter the path for the virtual hard disk file (VHDX):"
  $VHDPath = Read-Host ""
  ShowAndEditInput "VHDPath"
}

while (!$NetworkAdapterName) {
  Write-Host "Enter the name of the network adapter to connect to:"
  $NetworkAdapterName = Read-Host ""
  ShowAndEditInput "NetworkAdapterName"
}

while (!$Username) {
  Write-Host "Enter the administrator username for the VM:"
  $Username = Read-Host ""
  ShowAndEditInput "Username"
}

while (!$Password) {
  Write-Host "Enter the password for the administrator user (hidden):"
  $Password = Read-Host -AsSecureString
  ShowAndEditInput "Password"
}

# Display summary before proceeding
Write-Host "---------- Summary ----------"
Write-Host "VM Name: $VMName"
Write-Host "ISO Path: $ISOpath"
Write-Host "Generation: $Generation"
Write-Host "RAM: $MemoryStartupBytes MB"
Write-Host "CPU Cores: $ProcessorCount"
Write-Host "VHD Path: $VHDPath"
Write-Host "Network Adapter: $NetworkAdapterName"
Write-Host "Username: $Username"
Write-Host "---------- Continue? (Y/N) ----------"

$confirmation = Read-Host ""
if ($confirmation -eq "Y") {

  # Script logic to set up the VM using entered information
  # (replace this with your actual VM creation code)

  Write-Host "Setting up virtual machine..."
  # ... your VM creation code here ...

  Write-Host "Virtual machine setup complete!"
} else {
  Write-Host "Setup cancelled."
}

