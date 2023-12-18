# Prompt for user details
$firstName = Read-Host "Enter First Name:"
$lastName = Read-Host "Enter Last Name:"
$title = Read-Host "Enter Title:"
$department = Read-Host "Enter Department:"
$company = Read-Host "Enter Company:"
$location = Read-Host "Enter Location:"

# Build email address
$emailAddress = "$firstName@GlobeXpower.com"

# Build UPN logon
$upn = "$firstName@GlobeXpower.com"

# Build organizational unit path
$ouPath = "OU=$department,OU=GlobeX USA,DC=GlobeXpower,DC=com"

# Create new user
New-ADUser -Name "$firstName $lastName" -SamAccountName "$firstName$lastName" -Title $title -Department $department -Company $company -EmailAddress $emailAddress -UserPrincipalName $upn -Path $ouPath -Description "$firstName $lastName is the $title at $company in $location office." -PasswordNeverExpires:$true

# Optional: Display confirmation message
Write-Host "User $firstName $lastName created successfully!"
