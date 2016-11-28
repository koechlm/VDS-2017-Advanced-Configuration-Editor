<#
.SYNOPSIS
   <A brief description of the script>
.DESCRIPTION
   <A detailed description of the script>
.PARAMETER <paramName>
   <Description of script parameter>
.EXAMPLE
   <An example of using the script>
#>
Import-Module powerVault
Open-VaultConnection -Server 192.168.85.128 -User Administrator -Vault VLT-MKDE


$mFileIDs = New-Object 'System.Collections.Generic.List[System.Object]'
$mFileIDs.Add(99142)
$mPropInsts = $vault.PropertyService.GetPropertiesByEntityIds("File", $mFileIDs)