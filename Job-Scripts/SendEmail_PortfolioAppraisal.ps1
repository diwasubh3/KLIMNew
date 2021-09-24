
#This script will email the downloaded Portfolio Position Appraisal files from WSO SFTP. 

#Default variables
$jobName = "SendEmail_PortfolioAppraisal"
$fileDate = Get-Date -Format "yyyyMMdd";
$currentDateTime = Get-Date -Format "yyyyMMddhhmss";
$logFile = "C:\KLIM\Logs\$jobName$currentDateTime.txt"

#Function to be used for logging
New-Item $logFile
Function LogWrite
{
	Param ([string]$logstring)
	$DateStr = Get-Date -Format "MM/dd/yyyy HH:mm:ss "
	Add-content $logFile -value "$DateStr - $logstring"
}

LogWrite("----------------- Processing START -----------------") 

#Send Email variables
$sendEmailScriptPath = "C:\KLIM\Scripts\Send_Email.ps1"
$toEmail = "rakesh.patkar@ap.linedata.com"
$ccEmail = ""
$subject = "Portfolio Position Appraisal Files - $fileDate"
$body = "Attached Portfolio Appraisal Files."
$attachment = (get-childitem "C:\KLIM\WSOFiles-UAT\*PortfolioPositionAppraisal*$fileDate*").fullname 

LogWrite("Calling send email script") 
LogWrite("$sendEmailScriptPath -toEmail $toEmail -ccEmail $ccEmail -subject $subject -body $body -attachment $attachment -logFile $logFile") 
$returnMessage = &"$sendEmailScriptPath" -toEmail $toEmail -ccEmail $ccEmail -subject $subject -body $body -attachment $attachment -logFile $logFile
	
if ($returnMessage -eq "")
{
	LogWrite("Send email process completed.") 
}
else
{
	#LogWrite("Send email process failed with error message: $returnMessage") 
	exit 1
}

LogWrite("")
LogWrite("----------------- Processing END -----------------") 