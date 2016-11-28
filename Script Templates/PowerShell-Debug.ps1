#
# Enter-PsHostProcess -Name Connectivity.VaultPro
#
function ShowRunspaceID
{
            $id = [runspace]::DefaultRunspace.Id
            $app = [System.Diagnostics.Process]::GetCurrentProcess()
            [System.Windows.Forms.MessageBox]::Show("application: $($app.name)"+[Environment]::NewLine+"runspace ID: $id")
}
#
#Debug-Runspace -id <the ID returned before>