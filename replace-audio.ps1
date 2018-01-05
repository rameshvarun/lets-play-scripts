[System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

$OpenVideoFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenVideoFileDialog.Title = "Select the video for which the audio will be replaced."
$OpenVideoFileDialog.ShowDialog() | Out-Null

$OpenAudioFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$OpenAudioFileDialog.Title = "Select the new audio to put into the video."
$OpenAudioFileDialog.ShowDialog() | Out-Null

$SaveFileDialog = New-Object System.Windows.Forms.SaveFileDialog
$SaveFileDialog.Filter = "Avi Files (*.avi)|*.avi";
$OpenFileDialog.Title = "Select the new video location."
$SaveFileDialog.DefaultExt = ".avi"
$SaveFileDialog.ShowDialog() | Out-Null

ffmpeg -i $OpenVideoFileDialog.Filename -i $OpenAudioFileDialog.Filename -map 0:0 -map 1:0 -c:v copy -c:a libmp3lame -ac 2 -shortest $SaveFileDialog.Filename
