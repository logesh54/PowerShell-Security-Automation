# PowerShell-Security-Automation
Automated Windows event log monitoring and alerting using PowerShell.
🚀 Features

✅ Collects Windows Security Logs (Event IDs 4624 = Successful Logins, 4625 = Failed Logins)
✅ Exports collected logs into organized CSV reports
✅ Automatically detects and alerts on failed login attempts
✅ Sends email alerts through Outlook/Office 365
✅ Cleans up old reports automatically (older than 7 days)
✅ Fully automated — ideal for security monitoring and SOC environment.

⚙️ How It Works
1. Script checks Windows Event Viewer for logon events (past 1 hour)
2. Saves results to C:\Scripts\Reports\
3. I f failed logins are found, an email alert is sent to the configured address
4. ld reports are automatically deleted to save space

🧩 Technologies Used

*🖥️ PowerShell (Windows 10/11)
*🔐 Windows Event Logs (Security)
*📧 Outlook SMTP (smtp.office365.com)
*🗃️ CSV Log Exporting
*🧠 Learning Outcome

📝 Example Output

⚠️ ALERT: Failed login attempts detected!
🔢 Total failed logins: 4
📧 Outlook email alert sent successfully!
🧹 Old reports older than 7 days removed.
✅ Script completed successfully.

🏁 Conclusion

This project demonstrates how automation in PowerShell can simplify and enhance Windows security monitoring — a valuable skill for SOC Analysts, System Administrators, and Cybersecurity professionals.

