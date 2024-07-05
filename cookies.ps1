# Define la función para borrar cookies de Internet Explorer
function Clear-IECookies {
    Write-Host "Borrando cookies de Internet Explorer..."
    Remove-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\*' -Force -Recurse
    Remove-Item -Path 'C:\Users\*\AppData\Local\Microsoft\Windows\INetCookies\*' -Force -Recurse
}

# Define la función para borrar cookies de Microsoft Edge (Chromium)
function Clear-EdgeCookies {
    Write-Host "Borrando cookies de Microsoft Edge..."
    Remove-Item -Path 'C:\Users\*\AppData\Local\Microsoft\Edge\User Data\Default\Cookies' -Force -Recurse
    Remove-Item -Path 'C:\Users\*\AppData\Local\Microsoft\Edge\User Data\Profile *\Cookies' -Force -Recurse
}

# Define la función para borrar cookies de Google Chrome
function Clear-ChromeCookies {
    Write-Host "Borrando cookies de Google Chrome..."
    Remove-Item -Path 'C:\Users\*\AppData\Local\Google\Chrome\User Data\Default\Cookies' -Force -Recurse
    Remove-Item -Path 'C:\Users\*\AppData\Local\Google\Chrome\User Data\Profile *\Cookies' -Force -Recurse
}

# Define la función para borrar cookies de Mozilla Firefox
function Clear-FirefoxCookies {
    Write-Host "Borrando cookies de Mozilla Firefox..."
    Remove-Item -Path 'C:\Users\*\AppData\Roaming\Mozilla\Firefox\Profiles\*.default*\cookies.sqlite' -Force
    Remove-Item -Path 'C:\Users\*\AppData\Roaming\Mozilla\Firefox\Profiles\*.default*\cookies.sqlite-wal' -Force
    Remove-Item -Path 'C:\Users\*\AppData\Roaming\Mozilla\Firefox\Profiles\*.default*\cookies.sqlite-shm' -Force
}

# Función para comprobar el estado del Firewall de Windows
function Check-FirewallStatus {
    $status = Get-NetFirewallProfile -Profile Domain,Public,Private | Select-Object -Property Name,Enabled
    Write-Host "Estado actual del Firewall de Windows:"
    $status | Format-Table -AutoSize
}

# Función para comprobar si Windows Defender está activo
function Check-WindowsDefenderStatus {
    $defenderStatus = Get-Service -Name WinDefend
    Write-Host "Estado actual de Windows Defender:"
    Write-Host "$($defenderStatus.Status)"
}

# Ejecutar funciones
Clear-IECookies
Clear-EdgeCookies
Clear-ChromeCookies
Clear-FirefoxCookies
Check-FirewallStatus
Check-WindowsDefenderStatus
