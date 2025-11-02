# Logesh - PowerShell Security Automation (Outlook Version)
# Collects Windows Security logs, exports to CSV, detects failed logins,
# sends an Outlook email alert, and cleans up old reports.

# 1️⃣ Set output folder
$OutputFolder = "C:\Scripts\Reports"
If (!(Test-Path $OutputFolder)) {
    New-Item -Path $OutputFolder -ItemType Directory | Out-Null
}

# 2️⃣ Define logs to monitor (login events)
$EventIDs = 4624, 4625
$StartTime = (Get-Date).AddHours(-1)

# 3️⃣ Collect logs
$Logs = Get-WinEvent -FilterHashtable @{
    LogName = 'Security'
    ID       = $EventIDs
    StartTime = $StartTime
} | Select-Object TimeCreated, Id, Message

# 4️⃣ Export logs to CSV
$FileName = "SecurityReport_{0}.csv" -f (Get-Date -Format "yyyyMMdd_HHmmss")
$FullPath = Join-Path $OutputFolder $FileName
$Logs | Export-Csv -Path $FullPath -NoTypeInformation

# 5️⃣ Detect failed login attempts
$FailedLogins = $Logs | Where-Object { $_.Id -eq 4625 }

if ($FailedLogins.Count -gt 0) {
    Write-Host "⚠️ ALERT: Failed login attempts detected!" -ForegroundColor Red
    Write-Host "🔢 Total failed logins: $($FailedLogins.Count)" -ForegroundColor Yellow

    # Outlook Email Alert Settings
    $From = "Your outlook@outlook.com"
    $To = "Your mail@gmail.com"
    $Subject = "⚠️ Alert: Failed Logins Detected on $(hostname)"
    $Body = "There were $($FailedLogins.Count) failed login attempts on $(hostname) in the last hour.`n`nReport file: $FullPath"
    $SMTPServer = "smtp.office365.com"
    $SMTPPort = 587
    $Password = "YOUR_OUTLOOK_PASSWORD"  # Or app password if 2FA is on

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    try {
        Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body `
            -SmtpServer $SMTPServer -Port $SMTPPort -UseSsl `
            -Credential (New-Object System.Management.Automation.PSCredential($From, (ConvertTo-SecureString $Password -AsPlainText -Force)))
        Write-Host "📧 Outlook email alert sent successfully!" -ForegroundColor Green
    }
    catch {
        Write-Host "❌ Failed to send email alert: $($_.Exception.Message)" -ForegroundColor Red
    }
}
else {
    Write-Host "✅ No failed login attempts detected." -ForegroundColor Green
}

# 6️⃣ Cleanup old reports (older than 7 days)
Get-ChildItem $OutputFolder -Filter *.csv | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-7) } | Remove-Item
Write-Host "🧹 Old reports older than 7 days removed." -ForegroundColor Cyan

Write-Host "✅ Script completed successfully."
