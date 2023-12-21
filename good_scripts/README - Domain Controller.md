# Domain Controller Setup Script

**Description:**

This PowerShell script automates the process of setting up a new Domain Controller on a Windows Server. It guides users through the steps of inputting required information, installing necessary roles and features, configuring DNS, and promoting the server to a Domain Controller.

**Prerequisites:**

- Windows Server with PowerShell installed
- Administrative privileges on the server

**Usage:**

1. Save the script as a `.ps1` file (e.g., `DomainControllerSetup.ps1`).
2. Open a PowerShell window with administrative privileges.
3. Navigate to the directory where you saved the script.
4. Run the script using `.\DomainControllerSetup.ps1`.
5. Follow the prompts in the menu-driven interface to input information and perform actions.

**Key Features:**

- User-friendly menu for selecting actions
- Functions for:
    - Input domain, password, and computer name
    - Change computer name
    - Install AD roles and features
    - Configure DNS
    - Promote to Domain Controller
- Error handling to catch and report issues
- Correct credential handling for domain promotion
- Dynamic retrieval of server IP address for DNS configuration

**Important Notes:**

- **Test in a Controlled Environment:** Always test the script in a non-production environment before deploying it to critical systems.
- **Administrative Privileges:** Ensure you have administrative privileges on the server to execute the script successfully.
- **Error Handling:** Review any error messages carefully and take appropriate actions to address them.
- **Logging:** Consider implementing logging to record script execution details for troubleshooting and auditing purposes.

**Author:** Andrew Carroll

**Resources:** ChatGPT, Bard, Google, Microsoft, Stack Overflow, PowerShell documentation

**Date:** 2023-12-20