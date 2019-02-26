## robop install tool ##
Function InstallJdk {

    Write-Host "Installing OracleJDK..."
    Start-Process -FilePath ${ScriptDir}\jdk-8u201-windows-x64.exe -ArgumentList "/s" -Wait
    Write-Host "Done."
    
    Write-Host "Setting system PATH..."
    $UserPath = [Environment]::GetEnvironmentVariable('PATH', 'User')
    $UserPath += ';' + "C:\java\jdk1.8.201\bin\"
    [Environment]::SetEnvironmentVariable('PATH', $UserPath, 'User')
    Write-Host "Done."
    
    Write-Host "Updating JAVA_HOME..."
    $JavaHome = "C:\java\jdk1.8.201\"
    [Environment]::SetEnvironmentVariable('JAVA_HOME', $JavaHome, 'User')
    
    Write-Host "Done."
    Write-Host ("Current PATH:" + $UserPath)
    Write-Host ("Current JAVA_HOME:" + $JavaHome)

    return
}

Function InstallIntellij {
    Write-Host "Installing IntelliJ IDEA..."
    Write-Host "Unzip IntelliJ IDEA..."
    Expand-Archive $ScriptDir\ideaIC-2018.3.4.win.zip $ScriptDir
    Write-Host "Done."
    Write-Host "Setting user configuration..."

    Write-Host "Done."

    return
}

Function SetSpicapc{
    Write-Host "Unzip Spica-pc"
    Expand-Archive $ScriptDir\ideaIC-2018.3.4.win.zip $ScriptDir
    Write-Host "Done."
}

if (([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
            [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Start install sctipt..."
    $ScriptDir = Split-Path $MyInvocation.MyCommand.Path
    InstallJdk
    InstallIntellij
    SetSpicapc
    Write-Host "Finish install script!!"
}

else {
    Write-Warning "You are not Administrator!!"
    Write-Warning "Failed."
    exit 1
}


