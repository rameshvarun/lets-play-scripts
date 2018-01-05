[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenFileDialog.ShowDialog() | Out-Null

$SaveFileDialog = New-Object System.Windows.Forms.SaveFileDialog
$SaveFileDialog.Filter = "Wav Files (*.wav)|*.wav";
$SaveFileDialog.DefaultExt = ".wav"
$SaveFileDialog.ShowDialog() | Out-Null

ffmpeg -i $OpenFileDialog.Filename -vn -acodec copy $SaveFileDialog.Filename
