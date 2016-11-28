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

Open-VaultConnection -Server 192.168.85.128 -User Administrator -Vault MFG-2017-PRO-DE


$mEntType = "FLDR"
		$mDispName = "Baunummer"
		$mFileCategories = $vault.CategoryService.GetCategoriesByEntityClassId($mEntTyp, $true)