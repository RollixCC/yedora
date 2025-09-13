Add-Type -AssemblyName System.Windows.Forms
$form = New-Object System.Windows.Forms.Form
$form.Text = "Loading Bar Example"
$form.Width = 1000
$form.Height = 600
$progress = New-Object System.Windows.Forms.ProgressBar
$progress.Width = 800
$progress.Height = 50
$progress.Value = 5
$progress.Style = 'Continuous'
$progress.Location = New-Object System.Drawing.Point(100,275)
$form.Controls.Add($progress)
$form.Show()

for ($i=5; $i -le 100; $i++) {
    Start-Sleep -Milliseconds 50
    $progress.Value = $i
}

[void]$form.ShowDialog()
