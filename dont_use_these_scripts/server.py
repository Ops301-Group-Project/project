from getpass import getpass
import subprocess
import sys

def main():
    # Prompt for VM information
    server_name = input("Enter the Windows Server VM name: ")
    ip_address = input("Enter the static IPv4 address: ")
    netmask = input("Enter the subnet mask: ")
    dns_server = input("Enter the DNS server address: ")

    # Prompt for Active Directory information
    forest_name = input("Enter the Active Directory forest name: ")
    ou_name = input("Enter the Organizational Unit name: ")
    username = input("Enter the administrator username: ")
    password = getpass("Enter the administrator password: ")

    # Set static IP using netsh (modify for your platform)
    subprocess.run(f"netsh interface ip set address '{server_name}' static {ip_address} {netmask} {dns_server}", shell=True)

    # Rename VM (Replace with platform-specific command)
    subprocess.run(f"netdom renamecomputer {server_name}", shell=True)

    # Install AD-Domain-Services
    subprocess.run(f"Install-WindowsFeature AD-Domain-Services -IncludeManagementFeatures -IncludeADCS -Restart", shell=True)

    # Create AD Forest and OU using dcpromo (Replace with desired OU structure)
    subprocess.run(f"dcpromo /ForestCreation /NewForest /AdminAccount '{username}' /AdminPassword '{password}' /DomainName '{forest_name}' /FQDN '{forest_name}.local' /CreateDNSZone yes /NetbiosName '{forest_name}.local' /ReplicaOrPrimary DC /InstallDC /OU '{ou_name}'", shell=True)

    # Create users (Replace with desired users & attributes)
    subprocess.run(f"netdom new user /domain /machine:{server_name} /usern 'testuser' /password 'P@ssw0rd123!' /usero 'Regular Users'/add", shell=True)

    # Configure for DNS and DC service (adapt commands for your environment)
    subprocess.run("netsh advfirewall set allprofiles state on", shell=True)
    subprocess.run("netsh dns add server {dns_server}", shell=True)
    subprocess.run("netsh int ip set dns {dns_server}", shell=True)

    # **Note:** Additional configuration needed for full integration
    # Further steps may involve:
    # - Joining the server to the domain with `dcpromo /JoinDomain`
    # - Updating DNS forwarders
    # - Setting domain security and group policies
    # - Configuring DNS zones and replication


if __name__ == "__main__":
    main()
