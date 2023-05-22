#Start-Process -FilePath C:\WINDOWS\SysWOW64\RunDll32.EXE -ArgumentList '"C:\Program Files\NVIDIA Corporation\Installer2\InstallerCore\NVI2.DLL",UninstallPackage Display.GFExperience -silent'
Invoke-Command –ScriptBlock { 
    $date = Get-Date -Format dd-MM-yyyy-HH-mm-ss
    $apps = get-childitem "hklm:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall" | Get-ItemProperty -ErrorAction SilentlyContinue  

    foreach ($app in $apps) { 
        if ($app.DisplayName -like "*GeForce Experience*") { 
            if ($app.UninstallString) { $us = $app.UninstallString } else { $us = $app.UninstallString_Hidden } 
            if ($us -ne '') { 
                $app.DisplayName + ' ' + $us 
                $unused,$filepath,$arglist = $us -split '"', 3 
                $arglist = $arglist.Trim() + ' -silent' 
                Start-Process -FilePath $filepath -ArgumentList $arglist 2>&1|
		        Out-File -Append \\winsystem\otherdata$\storages\RemoteScriptLogs\Uninstall_GeForceExperience_Log\$env:computername-"("$Date")".txt
            } 
        }
    }
}