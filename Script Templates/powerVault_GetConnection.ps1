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
Open-VaultConnection -Server 192.168.85.139 -User Administrator -Vault "OTX 2016 ParallelWorkflow"

$mFileIds = {2}

$myFile = $vault.DocumentService.GetLatestFilesByMasterIds(@(2))

$properties = $vault.PropertyService.GetPropertiesByEntityIds("FILE",@($myFile[0].id))