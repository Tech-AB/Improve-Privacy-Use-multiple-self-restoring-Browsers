Run the Script:
===============

Set-ExecutionPolicy RemoteSigned
 
& '.\Unzip Zip-Archive to Destination.ps1' -targetdir 'C:\TestPowerShellScript\Unzipped' -zippath 'C:\TestPowerShellScript\PreparedFirefox\PreparedFirefox.zip'
 
Set-ExecutionPolicy Restricted