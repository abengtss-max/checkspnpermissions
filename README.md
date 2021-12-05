# Introduction
This repository contains a PowerShell script which checks Service Principals in Azure AD, what permissions is associated to the SP, as well as to what resource and also who have created the permissions in Azure.

## Limitations
- The script can only return a maximum of 1000 records from activity log in Azure, the limitation exist with the powershell cmdlet Get-AzLog.
- can only run on a single subscription, so before executing the Powershell script ensure you have the right permission to be able to query Azure AD. 
