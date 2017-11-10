param (
    [string]$SearchString = "*"
)
$Users = Get-ADUser -Filter $SearchString -Properties Samaccountname
$UserArray = @()
ForEach($item in $Users){
    $UserData = Get-ADUser -Identity $Users -Properties *
    $UserGroup = Get-ADPrincipalGroupMembership -Identity $UserData.SamAccountName | Select-Object Name
    $UserAccount = $UserData.SamAccountName
    $Name = $UserData.Name
    $Active = $UserData.Enabled
    $LastLogon = $UserData.LastLogonDate
    $UserCreated = $UserData.whenCreated
    $Group = $UserGroup | Out-String
    $UserArray += @($Name, $Active, $LastLogon, $UserCreated, $Group)
}

Write-Host $UserArray
Out-File -FilePath "ADInfo.txt" -InputObject $UserArray
