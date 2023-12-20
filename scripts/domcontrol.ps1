# Define variables for domain name, password, and computer name
$DomainName = $null
$Password = $null
$ComputerName = $null

# Function to input domain name, password, and computer name
function Input-Info {
    param (
        [ref]$DomainName,
        [ref]$Password,
        [ref]$ComputerName
    )

    $DomainName.Value = Read-Host "Enter the domain name (e.g., yourdomain.local)"
    $Password.Value = Read-Host "Enter a password for the Domain Administrator account" -AsSecureString
    $ComputerName.Value = Read-Host "Enter the computer name for the server"
}

# Function to change the computer name
function Change-ComputerName {
    param (
        [string]$NewComputerName
    )

    try {
        Rename-Computer -NewName $NewComputerName -Force -Restart
        Write-Host "Computer name changed to: $NewComputerName"
    }
    catch {
        Write-Host "Error changing computer name: $_"
    }
}

# Function to install required AD roles and features
function Install-ADRolesFeatures {
    try {
        Install-WindowsFeature -Name AD-Domain-Services, DNS -IncludeManagementTools -IncludeAllSubFeature -ErrorAction Stop
        Write-Host "AD roles and features installed successfully."
    }
    catch {
        Write-Host "Error installing AD roles and features: $_"
    }
}

# Function to configure DNS
function Configure-DNS {
    param (
        [string]$DomainName,
        [string]$ComputerName
    )

    try {
        Add-DnsServerPrimaryZone -Name $DomainName -ZoneFile "$DomainName.dns" -ErrorAction Stop
        Add-DnsServerResourceRecordA -ZoneName $DomainName -Name $ComputerName -IPv4Address (Test-Connection -ComputerName $ComputerName -Count 1).IPV4Address.IPAddressToString -ErrorAction Stop
        Write-Host "DNS configured successfully."
    }
    catch {
        Write-Host "Error configuring DNS: $_"
    }
}

# Function to promote the server to a Domain Controller
function Promote-DC {
    param (
        [string]$DomainName,
        [securestring]$Password,
        [string]$ComputerName
    )

    $SafeModePassword = ConvertTo-SecureString -String $Password -AsPlainText -Force

    try {
        Install-ADDSForest `
          -DomainName $DomainName `
          -DomainMode WinThreshold `
          -ForestMode WinThreshold `
          -DatabasePath "C:\Windows\NTDS" `
          -LogPath "C:\Windows\NTDS" `
          -SysvolPath "C:\Windows\SYSVOL" `
          -InstallDns `
          -SafeModeAdministratorPassword $SafeModePassword `
          -Force:$true -ErrorAction Stop
        Write-Host "Server promoted to Domain Controller successfully."
    }
    catch {
        Write-Host "Error promoting server to Domain Controller: $_"
    }
}

# Main menu
while ($true) {
    Clear-Host
    Write-Host "Domain Controller Setup Menu"
    Write-Host "1. Input Domain Name, Password, and Computer Name"
    Write-Host "2. Change Computer Name"
    Write-Host "3. Install Required AD Roles and Features"
    Write-Host "4. Configure DNS"
    Write-Host "5. Promote the Server to a Domain Controller"
    Write-Host "6. Exit"
    
    $choice = Read-Host "Enter your choice"

    switch ($choice) {
        '1' {
            Input-Info -DomainName ([ref]$DomainName) -Password ([ref]$Password) -ComputerName ([ref]$ComputerName)
            Write-Host "Domain Name: $($DomainName.Value)"
            Write-Host "Password: ********"
            Write-Host "Computer Name: $($ComputerName.Value)"
            Pause
        }
        '2' {
            Change-ComputerName -NewComputerName $ComputerName.Value
            Pause
        }
        '3' {
            Install-ADRolesFeatures
            Pause
        }
        '4' {
            Configure-DNS -DomainName $DomainName -ComputerName $ComputerName.Value
            Pause
        }
        '5' {
            Promote-DC -DomainName $DomainName -Password $Password -ComputerName $ComputerName.Value
            Pause
        }
        '6' {
            break
        }
        default {
            Write-Host "Invalid choice. Please select a valid option."
            Pause
        }
    }
}
