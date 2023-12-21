# 1. Backup and Recovery:

- **Purpose:** The purpose of this SOP is to provide guidelines and procedures to successfully complete the Backup & Data Recovery (BDR) process using both onsite & offsite systems.
- **Scope:** This SOP applies to all employees and contractors who require access to and storage of business-related data and assets.
- **Responsibilities:** The following personnel are responsible for implementing this SOP:
  1.	IT Management team – Install and configure:
    - Microsoft One Drive on user endpoints to ensure their ability to backup and recover important data to the cloud; then distribute access credentials to users
    - File server on Windows Server 2019 Active Directory to provide backup stroage for user' important data on prem; then distribute network mapping information for users to connect
  3.	Users – ensure all essential business-related data is backed up on either MS One Drive or Active Directory's File Server service and comply with all applicable policies, regulations, and laws with regards to what data is stored and how it’s safeguarded
- **Prerequisites:** Prior to backing up and recovering data, the following tasks must be complete:
  1.	Ensure proper and adequate licensing is obtained and managed, and, if necessary, submit formal purchase requests for more licenses
  2.	Microsoft One Drive and file server mapping must be properly configured on user endpoints.
  3.	The new users’ accounts must be created and added to the domain.
  4.	The new user’s role & responsibilities have been clearly defined.
  5.	The new user has been informed about the company’s IT policies and procedures and has signed the AUP.
- **Procedures:**
  1.	Create a desktop shortcut for Microsoft One Drive and the Active Directory File Server (if not already done).
  2.	Login using provided credentials (see IT Management if credentials are lost or forgotten)
  3.	Ensure data is backed up routinely to prevent data loss and enhance recovery efforts, if necessary.
- **References:** [Syncing Files to OneDrive](https://support.microsoft.com/en-au/office/sync-files-with-onedrive-in-windows-615391c4-2bd3-4aae-a42a-858262e42a49#bkmk_install)  
[Sharing OneDrive Files & Folders](https://support.microsoft.com/en-au/office/share-onedrive-files-and-folders-9fcc2f7d-de0c-4cec-93b0-a82024800c07#ID0EDBJ=Share_with_specific_people) 
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

# 4. Network Management and Security:

- **Purpose:** The purpose of this SOP is to provide an overview and guidelines of how Red Barons' network and its resources and assets will be managed.
- **Scope:** This SOP applies to all company-owned resources that contribute to the corporate network's infrastructure and domain.
- **Responsibilities:** The following personnel are responsible for implementing this SOP:
  1.	IT Management team – Ensure inventory, account, software/application, license, and patch/update, and change management systems are incorporated in a formal ITAM plan.  Network protection tools are to be deployed and routinely updated and monitored to include network scanning, threat detection and prevention, DLP, BDR, and thorough logging.
  2.	Supervisors/managers – Inform the IT management team of employees' transfer and/or termination to prevent privilege creep and other forms of unauthorized access to network resources
  3.	All users - Remain vigilant of risks and threats when utilizing network resources; complete mandatory annual cybersecurity awareness and phishing training; and report all vulnerabilities, threats, and malicious activity to the ISSO immediately or as soon as possible
- **Prerequisites:**
  1. All users', including IT Management team personnel, roles & responsibilities have been clearly defined.
  2. All users, including IT management team personnel, have read and understand Red Barons’ IT policies and procedures and have signed the AUP 
- **Procedures:**
  1.	Software & Patch Management
     - The IT Mangagement team will install and configure an upstream server to serve as the WSUS machine for patching, software updates, and OS version control. Senior IT personnel will approve updates before deployment.
  2. Network Monitoring & Security
    -  The IT management team will install and configure IDS/IPS and Wireshark to monitor network traffic, and Firewalls, DMZs, VPNs, and anti-malware to enhance network security.
  3.  Backup & Incident Handling
    - The IT management team will implement file server with a RAID 5 configuration and minimum 3 HDDs with 200GB capacity for backup storage, and a VPC will be procured and configured as a cloud site to prevent network disruptions and downtime. Additionally, any changes to hardware, software, or network configurations will be formally requested in memorandum format to the CIO.
- **References:** Include network guidelines.
- **Definitions:**
    1. WSUS : Windows Server Update System is used to manage software updates and security patches for user endpoints
    2. Cloud site : a virtual environment meant to replicate the corporate network for redundancy and high availabiility
    3. RAID : Redundant Array of Independent Disks is meant to ensure high availability for storage devices
- **Revision History:** 12/20/2023 -- "Network Management & Security SOP" created by David Renteria
