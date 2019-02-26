powershell Set-ExecutionPolicy RemoteSigned
cd /d %~dp0
powershell .\install.ps1
powershell Set-ExecutionPolicy Restricted