### Devs

- [Andrew Carroll](https://github.com/iAmAndrewCarroll)
- [Breanna Taylor](https://github.com/Btaylor007/Btaylor007)
- [Renona Gay](https://github.com/Foodisthebest)
- [Heraldo Morales](https://github.com/HeraldoM332)
- [David Renteria](https://github.com/drent23)
- [Edwin Pretel](https://github.com/EdInTech23)

## Scenario & Problem Domain

Your team is a MSP and has been selected by a growing technology company, that is in need of a network upgrade to support its expanding workforce and enhance data security. The company currently has 20 employees working in different departments, including Sales and Marketing, Research and Development, and IT Management.

The CEO has emphasized the importance of a secure and efficient network infrastructure that enables seamless communication between the office and the home company's central server. Additionally, the company wants to implement measures to safeguard data, improve collaboration through file shares, ensure business continuity with a robust backup solution, and establish an IT onboarding policy.

### System Selection

- Windows Server 2019 (DC & DNS)
- Windows 10 (endpoint)
- Windows Defender & Firewall (built-in antivirus)
- One Drive (backup solution)
- Active Directory
- pfSense (router, VPN, VLANs, DHCP)

### MVP

- A small office network that includes the following
  - 1 router
  - 1 server
  - 3 workstations (Sales & Marketing, Research & Development, and IT Management)
  - VPN tunnel between router and server
  - File share for each department
  - Hardened Firewall & Windows Defender
  - Backup solution for server
  - Domain Controller/DNS with automation scripts (check labs for examples)
  - Script
    - Fully setup the DC via script
  - Documentation 
    - IT onboarding policy (SOPs and/or AUP)
    - Org Chart