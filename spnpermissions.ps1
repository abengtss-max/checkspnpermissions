# Get SPNs and their respective permissions in subscription 
$spnpermission = Get-AzRoleAssignment | Where-Object {$_.ObjectType -eq "ServicePrincipal"}

# Obtain the resource id of the SPN
$resourceid = $spnpermission.RoleAssignmentId

#search Log activity in Azure and identify all activity asscoiated to the SPN 
$getactivity = Get-AzLog -ResourceId $resourceid 

# Lets create a timestamp as a name for the csv files.
$timestamp = Get-Date -Format o | ForEach-Object { $_ -replace ":", "." }

#exports variables to csv file
New-Object -TypeName PSCustomObject -Property @{
    SpnName = $spnpermission.DisplayName
    ObjectType = $spnpermission.ObjectType
    AssignedRoleTypeToSpn = $spnpermission.RoleDefinitionName
    AffectedResourceName = $spnpermission.Scope
    NameofCaller = $getactivity.Caller[0]
    TimeStamp = $getactivity.EventTimestamp[0]

    } | Export-Csv -Path .\spn-$timestamp.csv -Delimiter ';' -NoTypeInformation
