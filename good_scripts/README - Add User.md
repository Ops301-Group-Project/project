# New-ADUser-Prompt.ps1

**Purpose:**

- Automates the creation of new Active Directory users with interactive prompts.
- Gathers user details, suggests email and UPN, optionally creates OUs, and sets password.

**Prerequisites:**

- PowerShell 5.1 or later
- Active Directory module for PowerShell
- Permissions to create users and OUs in Active Directory

**Usage:**

1. Save the script as `aduser.ps1`.
2. Open a PowerShell window with administrative privileges.
3. Run the script using: `.\aduser.ps1`
4. Follow the prompts to provide user details.

**Features:**

- Prompts for: first name, last name, title, department, company, location, and OU.
- Suggests email and UPN based on first name and domain.
- Creates the specified OU if it doesn't exist.
- Sets a password (replace the placeholder with a secure password policy).

**Important Notes:**

- **Password Security:** The current script stores the password in plain text. Implement secure password handling for production use (e.g., Read-Host -AsSecureString, Get-Credential).
- **Error Handling:** The script might attempt to create users repeatedly if errors occur. Incorporate mechanisms to break out of loops and provide informative error messages.
- **Input Validation:** Expand input validation to all fields for data integrity.
- **Logging:** Implement logging to track script execution for auditing and troubleshooting.
- **Comments:** Add comments within the script to explain code sections and commands.
- **Testing:** Thoroughly test the script in a controlled environment before deployment.

**Disclaimer:**

- Use this script at your own risk.
- The author is not responsible for any damage or loss caused by its use.

**Author:** Andrew Carroll

**Resources:** ChatGPT, Bard, Google, Microsoft, Stack Overflow, PowerShell documentation

**Date:** 2023-12-20
