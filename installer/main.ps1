Add-Type -AssemblyName System.Windows.Forms
$form = New-Object System.Windows.Forms.Form
$form.Text = "YCC Bootstrapper"
$form.Width = 1000
$form.Height = 600
$progress = New-Object System.Windows.Forms.ProgressBar
$progress.Width = 800
$progress.Height = 50
$progress.Style = 'Continuous'
$progress.Value = 5
$progress.Location = New-Object System.Drawing.Point(100,275)
$form.Controls.Add($progress)

$cancel = New-Object System.Windows.Forms.Button
$cancel.Text = "Cancel"
$cancel.Width = 100
$cancel.Height = 30
$cancel.Location = New-Object System.Drawing.Point(450, 350)
$cancel.Add_Click({$form.Close()})
$form.Controls.Add($cancel)

$form.Show()

for ($i=5; $i -le 100; $i++) {
    Start-Sleep -Milliseconds 50
    $progress.Value = $i
}

[void]$form.ShowDialog()
