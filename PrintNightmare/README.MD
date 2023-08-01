# PrintNightmare-GoAway.ps1
This script was created by Chaim Black at Intrust IT in response to CVE 2021 34527 (PrintNightmare).

Based on a script written by Fabio Viggiani from Trusec, this script can create, remove or check the status of an ACL to block SYSTEM access to print spooler directory. This will prevent the system from being exploited, and will also prevent any printers from being installed.

Please see the following resources for more information on this as there are different options for mitigation of  this issue:

https://blog.truesec.com/2021/06/30/fix-for-printnightmare-cve-2021-1675-exploit-to-keep-your-print-servers-running-while-a-patch-is-not-available/

https://www.reddit.com/r/msp/comments/ob6y02/critical_vulnerability_printnightmare_exposes/

This script was written as a funtion, so it must be loaded or ran prior to actually running it. 

Example:
```
#Loads the module
Import-Module C:\user\downloads\PrintNightmare-GoAway.ps1

#Adds ACL, outputs result and logs it to C:\PSLogFolder
PrintNightmare-GoAway -Logpath C:\PSLogFolder -OutResult -AddACL

#Removes ACL, outputs result and logs it to C:\PSLogFolder
PrintNightmare-GoAway -Logpath C:\PSLogFolder -OutResult -RemoveACL

#Checks ACL status, outputs result and logs it to C:\PSLogFolder
PrintNightmare-GoAway -Logpath C:\PSLogFolder -OutResult -CheckStatus

#Adds ACL. Will not log result or display verification.
PrintNightmare-GoAway -AddACL
```

### Printers deployed via Group Policy
Several people told me that performing this ACL modification on computers where the printers are deployed via Group Policy and is set to "Replace" caused issues.
This is caused by the fact the printer is uninstalling and when it tries to reinstall itself, it gets stopped by this script.
I have not been able to verify or replicate this issue, but the recommended fix is to change the deployment to "Update."


### Final notes:
Complete testing on all operating systems \ PowerShell versions has NOT been done on this script yet, so run this at your own risk and further research it.
