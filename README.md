# Introduction
This repository contains a PowerShell script which checks Service Principals in Azure AD, what permissions is associated to the SP, as well as to what resource and also who have created the permissions in Azure. The script is written in PowerShell v7.

## Limitations
- The script can only return a maximum of 1000 records from activity log in Azure, the limitation exist with the powershell cmdlet Get-AzLog.
- can only run on a single subscription, so before executing the Powershell script ensure you have the right permission to be able to query Azure AD. 

## Procedure
1) Execute the PowerShell script **./spnpermissions.ps1**
2) Check your filesystem for a csv file **ls -all *.csv**
3) On your filesystem were you ran the PowerShell script you should find a file called **spn-<timestamp>.csv**
