## robop install tool ##

Write-Host "Start install sctipt..."

$ScriptDir = Split-Path $MyInvocation.MyCommand.Path

Function InstallJdk {

    Write-Host "Installing OracleJDK..."
    cmd /c "start ${ScriptDir}\jdk-8u201-windows-x64.exe /s /lang=1041 INSTALLDIR=C:\java\jdk1.8.201\ /L ${ScriptDir}\JDKsetup.log" 
    Write-Host "Done."
    
    Write-Host "Setting system PATH..."
    $UserPath = [Environment]::GetEnvironmentVariable('PATH', 'User')
    $UserPath += ';' +　"C:\java\jdk1.8.201\bin\"
    [Environment]::SetEnvironmentVariable('PATH', $UserPath, 'User')
    Write-Host "Done."
    
    Write-Host "Updating JAVA_HOME..."
    $JavaHome = "C:\java\jdk1.8.201\"
    [Environment]::SetEnvironmentVariable('JAVA_HOME', $JavaHome, 'User')
    
    Write-Host "Done."
    Write-Host ("Current PATH:" + $UserPath)
    Write-Host ("Current JAVA_HOME:" + $JavaHome)
}

Function InstallIntellij {
    
}

