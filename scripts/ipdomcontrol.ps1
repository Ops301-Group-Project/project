# Define variables for domain name, password, hostname, and IP address
$DomainName = $null
$Password = $null
$Hostname = $null
$IPAddress = $null

# Function to input domain name, password, hostname, and IP address
function Input-Info {
    param (
        [ref]$DomainName,
        [ref]$Password,
        [ref]$Hostname,
        [ref]$IPAddress
    )

    $DomainName.Value = Read-Host "Enter the domain name (e.g., yourdomain.local)"
    $Password.Value = Read-Host "Enter a password for the Domain Administrator account" -AsSecureString
    $Hostname.Value = Read-Host "Enter the hostname for the DNS entry (e.g., YourHostname)"
    $IPAddress.Value = Read-Host "Enter the IPv4 address for the DNS entry (e.g., 192.168.1.100)"
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
        [string]$Hostname,
        [string]$IPAddress
    )

    try {
        Add-DnsServerPrimaryZone -Name $DomainName -ZoneFile "$DomainName.dns" -ErrorAction Stop
        Add-DnsServerResourceRecordA -ZoneName $DomainName -Name $Hostname -IPv4Address $IPAddress -ErrorAction Stop
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
        [securestring]$Password
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
    Write-Host "1. Input Domain Name, Password, Hostname, IP Address"
    Write-Host "2. Install Required AD Roles and Features"
    Write-Host "3. Configure DNS"
    Write-Host "4. Promote the Server to a Domain Controller"
    Write-Host "5. Exit"
    
    $choice = Read-Host "Enter your choice"

    switch ($choice) {
        '1' {
            Input-Info -DomainName ([ref]$DomainName) -Password ([ref]$Password) -Hostname ([ref]$Hostname) -IPAddress ([ref]$IPAddress)
            Write-Host "Domain Name: $($DomainName.Value)"
            Write-Host "Password: ********"
            Write-Host "Hostname: $($Hostname.Value)"
            Write-Host "IP Address: $($IPAddress.Value)"
            Pause
        }
        '2' {
            Install-ADRolesFeatures
            Pause
        }
        '3' {
            Configure-DNS -DomainName $DomainName -Hostname $Hostname -IPAddress $IPAddress
            Pause
        }
        '4' {
            Promote-DC -DomainName $DomainName -Password $Password
            Pause
        }
        '5' {
            break
        }
        default {
            Write-Host "Invalid choice. Please select a valid option."
            Pause
        }
    }
}