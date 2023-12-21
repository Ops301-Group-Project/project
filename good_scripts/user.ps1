# Get the local domain name from Active Directory
$localDomain = (Get-ADDomain).Name

# Function to prompt for user details
Function Prompt-UserDetails {
    $firstName = Read-Host "Enter First Name:"
    $lastName = Read-Host "Enter Last Name:"
    $title = Read-Host "Enter Title:"
    $department = Read-Host "Enter Department:"
    $company = Read-Host "Enter Company:"
    $location = Read-Host "Enter Location:"
    $organizationalUnit = Read-Host "Enter Organizational Unit Name (or leave blank for default):"

    # Use the local domain name as a suggestion for email and UPN
    $suggestedEmail = "$firstName@$localDomain"
    $suggestedUPN = "$firstName@$localDomain"

    # Prompt the user with suggestions
    $emailAddress = Read-Host "Enter Email Address [$suggestedEmail]:"
    if ([string]::IsNullOrWhiteSpace($emailAddress)) {
        $emailAddress = $suggestedEmail
    }

    $upn = Read-Host "Enter UPN Logon [$suggestedUPN]:"
    if ([string]::IsNullOrWhiteSpace($upn)) {
        $upn = $suggestedUPN
    }

    # Set a default Organizational Unit Name if it's not provided
    if ([string]::IsNullOrWhiteSpace($organizationalUnit)) {
        $organizationalUnit = "Users" # Set a default value
    }

    # Verify if the specified Organizational Unit (OU) exists
    $ouExists = Get-ADOrganizationalUnit -Filter {Name -eq $organizationalUnit} -ErrorAction SilentlyContinue

    if (-not $ouExists) {
        # The OU doesn't exist, so create it
        try {
            New-ADOrganizationalUnit -Name $organizationalUnit -Path "DC=$localDomain,DC=com"
            Write-Host "Organizational Unit '$organizationalUnit' created successfully!"
        }
        catch {
            Write-Host "Error creating Organizational Unit '$organizationalUnit': $_"
            Write-Host "Error Details:"
            Write-Host $_.Exception.Message
        }
    }

    # Construct the organizational unit path dynamically
    $ouPath = "OU=$organizationalUnit,DC=$localDomain,DC=com"

    # Generate a secure password (you can customize this)
    $password = ConvertTo-SecureString -AsPlainText "P@ssw0rd" -Force

    # Create new user with password
    try {
        New-ADUser -Name "$firstName $lastName" -SamAccountName "$firstName$lastName" -Title $title -Department $department -Company $company -EmailAddress $emailAddress -UserPrincipalName $upn -Path $ouPath -Description "$firstName $lastName is the $title at $company in $location office." -PasswordNeverExpires:$true -AccountPassword $password
        Write-Host "User $firstName $lastName created successfully!"
    }
    catch {
        Write-Host "Error creating user: $_"
        Write-Host "Error Details:"
        Write-Host $_.Exception.Message
        # Allow the user to try again
        Prompt-UserDetails
    }
}

# Call the function to start the user details prompt
Prompt-UserDetails
