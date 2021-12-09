# Get SPNs and their respective permissions in subscription 
$spnpermission = Get-AzRoleAssignment | Where-Object {$_.ObjectType -eq "ServicePrincipal"} 

# Obtain the resource id of the SPN
$resourceid = $spnpermission.RoleAssignmentId

$activitylogarray = @()
# loop
foreach ($element in $resourceid ) {
	# Find entries in the activity log for all matched spns
    $activitylogarray += Get-AzLog -ResourceId $element
    $activitylogarray.Caller
    $element

    New-Object -TypeName PSCustomObject -Property @{
    SpnName = $spnpermission.DisplayName
    ObjectType = $spnpermission.ObjectType
    AssignedRoleTypeToSpn = $spnpermission.RoleDefinitionName
    AffectedResourceName = $spnpermission.Scope
    NameofCaller = $activitylogarray.Caller.
    TimeStamp = $activitylogarray.EventTimestamp

    }


} 
#$activitylogarray.Properties.requestbody


#Get-AzLog -StartTime (Get-Date).AddDays(-7) | Where-Object {$_.Properties.requestbody -like '*'}
# Lets create a timestamp as a name for the csv files.
#$timestamp = Get-Date -Format o | ForEach-Object { $_ -replace ":", "." }

#$output | Export-Csv -Path .\spn-$timestamp.csv -Delimiter ';' -NoTypeInformation


#search Log activity in Azure and identify all activity asscoiated to the SPN 
#$getactivity = Get-AzLog -ResourceId $resourceid 

#exports variables to csv file
#$output = New-Object -TypeName PSCustomObject -Property @{
#    SpnName = $spnpermission.DisplayName
#    ObjectType = $spnpermission.ObjectType
#    AssignedRoleTypeToSpn = $spnpermission.RoleDefinitionName
#    AffectedResourceName = $spnpermission.Scope
#    NameofCaller = $activitylogarray.Caller
#    TimeStamp = $activitylogarray.EventTimestamp

#    } $output | Export-Csv -Path .\spn-$timestamp.csv -Delimiter ';' -NoTypeInformation