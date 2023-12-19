# 1. Backup and Recovery:

- **Purpose:** The purpose of this SOP is to provide guidelines and procedures to successfully complete the Backup & Data Recovery (BDR) process using Veeam Agent for Windows.
- **Scope:** This SOP applies to all employees and contractors who require access to and storage of business-related data and assets.
- **Responsibilities:** The following personnel are responsible for implementing this SOP:
  1.	IT Management team – install and configure Veeam BDR software and settings on user endpoints to ensure their ability to backup and recover important data; distribute access credentials to users
  2.	Users – ensure all essential business-related data is backed up using the Veeam application and comply with all applicable policies, regulations, and laws with regards to what data is stored and how it’s safeguarded
- **Prerequisites:** Prior to backing up and recovering data, the following tasks must be complete:
  1.	Ensure proper and adequate licensing is obtained and managed, and, if necessary, submit formal purchase requests for more licenses
  2.	Veeam web application software must be installed and properly configured on user endpoints.
  3.	The new users’ accounts must be created and linked to Red Barons’ Veeam enterprise account.
  4.	The new user’s role & responsibilities have been clearly defined.
  5.	The new user has been informed about the company’s IT policies and procedures and has signed the AUP.
- **Procedures:**
  1.	Install Veeam software and create a desktop shortcut (if not already done).
  2.	Login using provided credentials (see IT Management if credentials are lost or forgotten)
  3.	Select “Inventory” in the bottom left corner
  4.	For off-site (cloud) components:
    1.	Select “Virtual Infrastructure”
    2.	Select “Add Server”
    3.	Type in “corp.redbarons.com” in DNS Server/Name block
    4.	Type in your domain credentials on the next screen
    5.	Select “Apply” then “Finish”
  5.	For on-site (on-prem) components:
    1.	Select “Physical Infrastructure”
    2.	Select “Create Protection Group”
    3.	In Name, enter “corp.redbarons.com”, in Type enter “Computer”
    4.	In “Active Directory” section, ensure “corp.redbarons.com.veeam.local” is listed in the search box
    5.	In Credentials, type in your domain credentials
  6.	For File Share Protection
    1.	Select “Add File Share”
    2.	Type in the IP address of the file share server (Windows Server 2019 machine)
- **References:** [Getting Started](https://helpcenter.veeam.com/docs/vac/provider_user/get_started.html?ver=80)  
[Accounts & Roles](https://helpcenter.veeam.com/docs/backup/em/em_about_accounts_and_roles.html?ver=120) 
- **Definitions:**
  1. Backup : storing a copy of original data which can be used in case of data loss. Backup is considered one of the approaches to data protection. Important data of the organization needs to be kept in backup efficiently for protecting valuable data (Source: https://www.geeksforgeeks.org/difference-between-backup-and-recovery/)
  2. Recovery (data) : restoring lost data by following some processes (Source: https://www.geeksforgeeks.org/difference-between-backup-and-recovery/
  3. Network Infrastructure : the hardware and software that enable network connectivity and communication between users, devices, apps, the internet, and more (Source: https://www.cisco.com/c/en/us/solutions/enterprise-networks/what-is-network-infrastructure.html)
- **Revision History:** 12/18/2023 -- "Backup & Data Recovery (BDR) SOP" created by David Renteria

# 2. File Share Connectivity:

- **Purpose:** The purpose of this SOP is to provide guidelines for connecting to the departmental file shares in order for teams to securely store and share data.
- **Scope:** This SOP applies to all Red Baron employees and contractors who require access to organizational file shares.
- **Responsibilities:** The following personnel are responsible for implementing this SOP:
  1.	IT Management team – Configure and maintain the file share and user endpoints’ ability to connect to it
  2.	Supervisors/managers – Ensure “Notification of Departmental Transfer or Termination” memos are sent to the IT Management team to prevent privilege/permission creep and minimize security vulnerabilities
- **Prerequisites:** Prior to configuring and granting file share access, the following tasks must be complete:
  1.	The user’s account has been created and added to the domain & respective organizational unit.
  2.	The user’s role & responsibilities have been clearly defined.
  3.	The user has been informed about the company’s IT policies and procedures and has signed the AUP.
- **Procedures:**
  1.	Ensure “Network Discovery” is enabled on user’s machine.
  2.	Open Windows File Explorer.
  3.	Right click on “This PC” and select “Map Network Drive”.
  4.	Select “Drive: Z”.
  5.	Type “\\corp.redbarons.com\Name of OU File Share Drive” in Internet or Network Address Box
  6.	Select “Finish”
- **References:** [How to map a network (share) drive from Windows 10](https://support.microsoft.com/en-us/windows/map-a-network-drive-in-windows-29ce55d1-34e3-a7e2-4801-131475f9557d)
- **Definitions:** Share drive - shared spaces where teams can easily store, search, and access their files from any networked, authenticated device
- **Revision History:** 12/18/2023 -- "File Share Connectivity SOP" created by David Renteria

# 3. VPN Connectivity:

- **Purpose:** The purpose of this SOP is to provide guidelines for connecting to the company Virtual Private Network (VPN) in order for users to access the network and its resources from remote locations.
- **Scope:** This SOP applies to all Red Baron employees and contractors who require VPN access to the company network.
- **Responsibilities:** The following personnel are responsible for implementing this SOP:
  1.	IT Management Team – Configure and maintain company routers and VPN protocols to enable user endpoints’ remote access to the network
  2.	Supervisors/managers – Ensure “Authorization for Remote Work” memos are signed by upper management and then sent to the IT Management team to authorize installation and setup of VPN software & protocols
- **Prerequisites:** Prior to configuring and granting file share access, the following tasks must be complete:
  1.	The user’s account has been created and added to the domain & respective organizational unit.
  2.	The user’s role & responsibilities have been clearly defined.
  3.	The user has been informed about the company’s IT policies and procedures and has signed the AUP and submitted the signed “Authorization for Remote Work” memorandum.
- **Procedures:**
  1.	Open the VPN client tool icon located on the right side of the taskbar.
  2.	Find & select the “corp.redbarons.com” server.
  3.	Click the “Connect” button
  4.	Enter authentication credentials (provided to you by the IT Management team)
  5.	Login as normal after connection has been successfully established
- **References:** [How to connect to VPN on Windows 10](https://support.microsoft.com/en-us/windows/connect-to-a-vpn-in-windows-3d29aeb1-f497-f6b7-7633-115722c1009c) 
- **Definitions:** VPN : Virtual Private Networks, or VPNs, is an encrypted connection over the Internet from a device to a network. The encrypted connection helps ensure that sensitive data is safely transmitted. It prevents unauthorized people from eavesdropping on the traffic and allows the user to conduct work remotely (Source: https://www.cisco.com/c/en/us/products/security/vpn-endpoint-security-clients/what-is-vpn.html)
- **Revision History:** 12/18/2023 -- "VPN Connectivity SOP" created by David Renteria

# 4. Troubleshooting Methodology:

- **Purpose:** To resolve technical issues efficiently.
- **Scope:** Troubleshooting processes.
- **Responsibilities:** IT team.
- **Prerequisites:** Troubleshooting guidelines.
- **Procedures:** Describe the step-by-step troubleshooting approach.
- **References:** Include troubleshooting resources.
- **Definitions:** Define troubleshooting terms.
- **Revision History:** Keep track of revisions and contributors.

# 5. Technology Purchase Requests:

- **Purpose:** To manage technology procurement.
- **Scope:** All technology purchase requests.
- **Responsibilities:** Procurement team.
- **Prerequisites:** Approval process.
- **Procedures:** Explain the request and approval process.
- **References:** Include procurement guidelines.
- **Definitions:** Define technology purchase requests.
- **Revision History:** Document revisions and contributors.

# 6. Onboarding Technology Needs:

- **Purpose:** To ensure new employees have the necessary technology.
- **Scope:** Employee onboarding.
- **Responsibilities:** HR and IT teams.
- **Prerequisites:** Onboarding process.
- **Procedures:** Detail technology provisioning for new hires.
- **References:** Include onboarding guidelines.
- **Definitions:** Define onboarding technology needs.
- **Revision History:** Track revisions and contributors.

# 7. Termination Technology Handling:

- **Purpose:** To secure company data during employee terminations.
- **Scope:** Employee terminations.
- **Responsibilities:** HR and IT teams.
- **Prerequisites:** Termination process.
- **Procedures:** Explain data and access revocation.
- **References:** Include termination protocols.
- **Definitions:** Define termination technology handling.
- **Revision History:** Record revisions and contributors.

# 8. Remote Support Engagements:

- **Purpose:** To provide offsite technical assistance.
- **Scope:** Remote support scenarios.
- **Responsibilities:** IT team.
- **Prerequisites:** Remote support tools.
- **Procedures:** Describe remote support workflow.
- **References:** Include remote support guidelines.
- **Definitions:** Define remote support engagements.
- **Revision History:** Document revisions and contributors.

# 9. Endpoint Security for Windows 10:

- **Purpose:** To protect Windows 10 workstations.
- **Scope:** All Windows 10 devices.
- **Responsibilities:** IT team.
- **Prerequisites:** Security tools and policies.
- **Procedures:** Explain security configurations and monitoring.
- **References:** Include security guidelines.
- **Definitions:** Define endpoint security.
- **Revision History:** Track revisions and contributors.

# 10. Network Enhancement and Security:

- **Purpose:** To improve network usability and security.
- **Scope:** Company network.
- **Responsibilities:** IT team.
- **Prerequisites:** Network analysis.
- **Procedures:** Describe network enhancements and security measures.
- **References:** Include network guidelines.
- **Definitions:** Define network enhancements.
- **Revision History:** Record revisions and contributors.
