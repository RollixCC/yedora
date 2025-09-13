Add-Type -AssemblyName Microsoft.Web.WebView2.WinForms
Add-Type -AssemblyName System.Windows.Forms

$form = New-Object System.Windows.Forms.Form
$form.Text = "Loading Bar Example"
$form.Width = 1000
$form.Height = 600

$webview = New-Object Microsoft.Web.WebView2.WinForms.WebView2
$webview.Dock = [System.Windows.Forms.DockStyle]::Fill
$form.Controls.Add($webview)

$html = @"
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Loading Bar</title>
<style>
  body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: white;
    margin: 0;
  }
  #container {
    width: 80%;
    height: 50px;
    background-color: #eee;
    border-radius: 5px;
    overflow: hidden;
    position: relative;
  }
  #bar {
    width: 5%;
    height: 100%;
    background-color: green;
    transition: width 0.2s ease;
  }
</style>
</head>
<body>
  <div id="container">
    <div id="bar"></div>
  </div>
<script>
  let width = 5;
  let interval = setInterval(() => {
    if (width >= 100) {
      clearInterval(interval);
    } else {
      width += 1; 
      document.getElementById('bar').style.width = width + '%';
    }
  }, 50);
</script>
</body>
</html>
"@

$webview.EnsureCoreWebView2Async() | Out-Null
$webview.NavigateToString($html)

[void]$form.ShowDialog()
