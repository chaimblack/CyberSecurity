# Log4Shell-PowerChuteFix.ps1

Written by Chaim Black

Version: 1.1

Created on 12/21/2021

Last update: 12/21/2021

Change log:

    Version 1.1: Adds support to check for APC PowerChute Network Shutdown service in addition to APC PowerChute Business Edition.

Warning!! This script has not been verified by APC. Run at your own risk. 

This script is in response to to CVE-2021-44228 (Log4Shell) to remediate the APC PowerChute software. This remdiates APC PowerChute Network Shutdown and APC PowerChute Business Edition.

Based off of information from https://www.se.com/ww/en/download/document/SESB-2021-347-01/

This script searches for and removes 'JndiLookup.class' from the log4j file. 
Requires .Net 4.5

Outputs:

    "Success"                      = Script was a success
    "NoIssueFound"                 = Located and found file and no detection of JndiLookup.class
    "FailedToStop"                 = Failed to stop service
    "DotNetError"                  = Missing required .Net 4.5
    "FailedToLocate"               = Failed to locate any log4j files
    "CompressionError"             = Failed to load compression
    "FailedToFix"                  = Failed to remediate file by removing JndiLookup.class
    "Success_FailedToRestart"      = Failed to restart service after removing JndiLookup.class
    "NoIssueFound_FailedToRestart" = Failed to restart service after not finding any issue