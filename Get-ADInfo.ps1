param(
    [string]$UserID
)
$UserID = "tulibarri"
$UserData = Get-ADuser -Identity $UserID -Properties *
$UserGroup = Get-ADPrincipalGroupMembership -Identity $UserID | Select-Object Name

$UserAccount = $UserData.SamAccountName
$Name = $UserData.Name
$Active = $UserData.Enabled
$LastLogon = $UserData.LastLogonDate

Write-Host $UserAccount, $Name, $Active, $LastLogon
Write-Host $UserGroup