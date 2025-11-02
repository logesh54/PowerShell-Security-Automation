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

#Screen shots



1. <img width="1918" height="914" alt="Screenshot 2025-11-02 113249" src="https://github.com/user-attachments/assets/21a2ecbc-3402-454b-bfc7-67eee482fe23" />
2. <img width="959" height="457" alt="Screenshot 2025-11-02 113252" src="https://github.com/user-attachments/assets/23e3078e-f015-4e35-9de6-a9dce990d35c" />
3. <img width="1919" height="636" alt="Screenshot 2025-11-02 113335" src="https://github.com/user-attachments/assets/be5a139e-bdb8-49a2-b35c-c7cae10e6b0f" />
4. <img width="1919" height="132" alt="Screenshot 2025-11-02 113413" src="https://github.com/user-attachments/assets/2058096a-0f9f-496e-b3db-d14a61cfaf84" />
5. <img width="1616" height="765" alt="Screenshot 2025-11-02 113529" src="https://github.com/user-attachments/assets/72cbaf6a-fd57-47bd-b537-6529753d5359" />
6. <img width="1915" height="925" alt="Screenshot 2025-11-02 113644" src="https://github.com/user-attachments/assets/f7b64f3e-b3b6-46eb-b947-a7255ba145ab" />
