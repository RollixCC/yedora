Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "YCC Bootstrapper"
$form.Size = New-Object System.Drawing.Size(400, 150)
$form.StartPosition = "CenterScreen"

$label = New-Object System.Windows.Forms.Label
$label.Text = "Loading..."
$label.AutoSize = $true
$label.Location = New-Object System.Drawing.Point(160, 20)
$form.Controls.Add($label)

$progress = New-Object System.Windows.Forms.ProgressBar
$progress.Minimum = 0
$progress.Maximum = 100
$progress.Value = 0
$progress.Style = 'Continuous'
$progress.Size = New-Object System.Drawing.Size(350, 30)
$progress.Location = New-Object System.Drawing.Point(20, 60)
$form.Controls.Add($progress)

$button = New-Object System.Windows.Forms.Button
$button.Text = "Cancel"
$button.Size = New-Object System.Drawing.Size(80, 30)
$button.Location = New-Object System.Drawing.Point(160, 100)
$button.Add_Click({ $form.Close() })
$form.Controls.Add($button)

$form.Show()

for ($i=0; $i -le 100; $i+=2) {
    Start-Sleep -Milliseconds 50
    $progress.Value = $i
    [System.Windows.Forms.Application]::DoEvents()
}

$label.Text = "Done!"
Start-Sleep -Seconds 1
$form.Close()
