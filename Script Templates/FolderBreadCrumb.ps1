#
# Sample code to get Folder tree
#
#	call function example:  
#		$rootFolder = $vault.DocumentService.GetFolderByPath("$/Designs")
#   	$root = New-Object PSObject -Property @{ Name = $rootFolder.Name; ID=$rootFolder.Id }	
#   	AddCombo -data $root


function AddCombo($data)
{
	if ($data.Name -eq '.' -or $data.Id -eq -1)
	{
		return
	}
	$children = GetChildFolders -folder $data
	if($children -eq $null) { return }
	$breadCrumb = $dsWindow.FindName("BreadCrumb")
	$cmb = New-Object System.Windows.Controls.ComboBox
	$cmb.Name = "cmbBreadCrumb_" + $breadCrumb.Children.Count.ToString();
	$cmb.DisplayMemberPath = "Name";
	$cmb.ItemsSource = @($children)
	$cmb.IsDropDownOpen = $true
	$cmb.add_SelectionChanged({
			param($sender,$e)
			OnSelectionChanged -sender $sender
		});
	$breadCrumb.Children.Add($cmb);
}

function GetChildFolders($folder)
{
	$ret = @()
	$folders = $vault.DocumentService.GetFoldersByParentId($folder.ID, $false)
	if($folders -ne $null)
	{
		foreach ($item in $folders) 
		{
			$f = New-Object PSObject -Property @{ Name = $item.Name; ID=$item.Id } 
			If ($f.Name -ne 'Inaccessible')
			{
				$ret += $f
			}
		}
	}
	$ret += New-Object PSObject -Property @{ Name = "."; ID=-1 }
	return $ret
}

function GetFullPathFromBreadCrumb($breadCrumb)
{
	$path = ""
	foreach ($crumb in $breadCrumb.Children) 
	{
		$path += $crumb.SelectedItem.Name+"\"
	}
	return $path
}

function OnSelectionChanged($sender)
{
	$breadCrumb = $dsWindow.FindName("BreadCrumb")
	$position = [int]::Parse($sender.Name.Split('_')[1]);
	$children = $breadCrumb.Children.Count - 1
	while($children -gt $position )
	{
		$breadCrumb.Children.Remove($breadCrumb.Children[$children]);
		$children--;
	}
	$path = GetFullPathFromBreadCrumb -breadCrumb $breadCrumb
	$Prop["Folder"].Value = $path
	AddCombo -data $sender.SelectedItem
}





