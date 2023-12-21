# Function to display existing input with option to edit
function ShowAndEditInput($variableName) {
  if ($PSBoundParameters.ContainsKey($variableName)) {
    $existingValue = ${$variableName}
    Write-Host "Current value for ${variableName}: ${existingValue}"
    Write-Host "Press Enter to keep, or enter a new value and press Enter:"
    $newValue = Read-Host ""
    if ($newValue) {
      ${$variableName} = $newValue
      Write-Host "Value updated."
    }
  } else {
    Write-Host "Enter the value for " + $variableName + ":"
    $newValue = Read-Host "Enter the path to the ISO image file (.iso)"
    if ($newValue) {
      ${$variableName} = $newValue
      Write-Host "Value saved."
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
ShowAndEditInput "VMName"

while (!$ISOpath) {
  ShowAndEditInput "ISOpath"
}

# Validate Generation with input limit
$invalidCount = 0
while (-not ([int]$Generation -like "2|3") -and $invalidCount -lt 3) {
  ShowAndEditInput "Generation"
  $invalidCount++
}

if ($invalidCount -ge 3) {
  Write-Error "Invalid generation input entered too many times. Exiting..."
  exit
}

# Validate Memory with minimum value
while (-not ([int]$MemoryStartupBytes -ge 1024)) {
  ShowAndEditInput "MemoryStartupBytes"
}

# Validate Processor count with minimum value
while (-not ([int]$ProcessorCount -ge 1)) {
  ShowAndEditInput "ProcessorCount"
}

ShowAndEditInput "VHDPath"

ShowAndEditInput "NetworkAdapterName"

ShowAndEditInput "Username"

# Hide password input
$Password = Read-Host -AsSecureString "Enter the password for the administrator user (hidden):"

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

  # Import-Module PS-VirtualBox
  Import-Module PS-VirtualBox

  # Create a new VM
  $vm = New-VM -Name $VMName -MemoryStartupBytes $MemoryStartupBytes -ProcessorCount $ProcessorCount -Generation $Generation

  # Add virtual hard disk and CD/DVD drive
  Set-VMHardDiskDrive -VM $vm -Path $VHDPath -ControllerIDE 0
  Set-VMHardDiskDrive -VM $vm -Path $ISOpath -ControllerIDE 1 -MediaType CDDVD

  # Configure network adapter (adjust based on desired type)
  New-VMNetworkAdapter -VM $vm -Name $NetworkAdapterName -AdapterType NAT

  # Set VM username and password
  Set-VMGuestProperty -VM $vm -Name "AutoLogonEnabled" -Value 1
  Set-VMGuestProperty -VM $vm -Name "AutoLogonUser" -Value $Username
  Set-VMGuestProperty -VM $vm -Name "AutoLogonPassword" -Value $Password

  # Start the VM
  Start-VM -VM $vm
  Write-Host "Virtual machine started. Name: $vm.Name"
} else {
  Write-Host "Virtual machine creation cancelled."
}
