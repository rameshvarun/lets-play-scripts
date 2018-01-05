[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.ShowDialog() | Out-Null

$SaveFileDialog = New-Object System.Windows.Forms.SaveFileDialog
$SaveFileDialog.Filter = "Avi Files (*.avi)|*.avi";
$OpenFileDialog.Title = "Select the new video location."
$SaveFileDialog.DefaultExt = ".avi"
$SaveFileDialog.ShowDialog() | Out-Null

$StartTime = Read-Host -Prompt 'Input the Start Time (min:sec, for example 0:9.4)'
$EndTime = Read-Host -Prompt 'Input the End Time (min:sec, for example 30:13.5)'

ffmpeg -ss $StartTime -i $OpenFileDialog.Filename -t $EndTime -c copy $SaveFileDialog.Filename
