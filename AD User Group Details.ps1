#######################################################################################################
#NAME:AD User Group Details.ps1
#PURPOSE:It will fetch the users group/Group description information from Active directory DB
#The script has been tested on below Servers
#Windows 2008  DC
#Windows 2008R2  DC
#Windows 2012 DC
#Windows 2012 R2 DC
#AUTHOR:SAJEEV.S 
#DATE WRITTEN:17-Mar-2017
#MODIFICATION HISTORY:
########################################################################################################
#The Set-ExecutionPolicy cmdlet enables you to determine which Windows PowerShell scripts 
#(if any) will be allowed to run on your computer - We have not set ANY ExecutionPolicy in this script
#Set-ExecutionPolicy RemoteSigned


# The following line is used to import the active directory module to execute the power shell cmdlets
import-module activedirectory

#$Name used to input AD user name in the script 
$Name = Read-Host -Prompt 'Input the user name'

#The Get-ADUser cmdlet gets a user object or performs a search to retrieve multiple user objects
$User = Get-ADUser -LDAPFilter "(sAMAccountName=$Name)"

#The following condition is used to check the uses is exist in Active directory or not 

If ($User -eq $Null)
{

#following message will display, if the user not exist in the server 
"User does not exist in AD"

}

Else

{

#The Get-ADPrincipalGroupMembership cmdlet gets the Active Directory groups that have a specified 
#user, computer, group, or service account as a member.

#Get-ADPrincipalGroupMembership $User | Get-ADGroup -Properties * | select name, description | more | format-table name,Description -Autosize | Out-File "$Name .txt"

Get-ADPrincipalGroupMembership $User| Get-ADGroup -Properties * | format-table -Wrap -autosize  -property name,description | Out-File "$Name.txt"

}
########################################################################################################