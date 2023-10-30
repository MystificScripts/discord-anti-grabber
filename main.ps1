####################################<VARIABLES ASSIGNING!!!>####################################
$discPathUwu = Join-Path $env:LOCALAPPDATA 'Discord'
$folders = Get-ChildItem $discPathUwu | Where-Object { $_.Name -like 'app-*' }
$infected = $false
$imsorryfouryourkiditsjustyourlife = Join-Path $env:USERPROFILE 'AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup'
$ilovelatinas = @(".src", ".scr", ".js", ".cpp", ".cs", ".exe", ".bat", ".ps1", ".txt")
$commonpath = 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup'
####################################<VARIABLES ASSIGNING!!!>####################################


####################################<COLOR ASSIGNING!!!>####################################
$GREEN = [System.ConsoleColor]::Green #IM TRYING TO DO READABLE CODE, BESIDES VARIABLE NAMING YK WHAT THIS DOES ASSIGNS THE COLOR THAT CAN BE USED LATER ON IN PRINTING
$RED = [System.ConsoleColor]::Red #ik i can do this -foregroundcolor red or wtv, but i used this cuz idk it is what it is
$DEFAULT = [System.ConsoleColor]::White
####################################<COLOR ASSIGNING!!!>####################################


####################################<THIS IS DESKTOP CORE INDEX.JS FILE, THIS DOESNT REQUIRE UAC>####################################
foreach ($folder in $folders) {
    $david = Join-Path $folder.FullName 'modules\discord_desktop_core-1\discord_desktop_core\index.js'
    $fileSize = (Get-Item $david).Length / 1KB
    $balls = Get-Content $david -Raw

    if ($fileSize -gt 1 -and $balls -ne "module.exports = require('./core.asar');") {
        Set-Content -Path $david -Value "module.exports = require('./core.asar');"
        $infected = $true
        Write-Host "[-] Discord was infected." -ForegroundColor $RED
    }
}

if ($infected -eq $false) {
    Write-Host "[+] Discord wasn't infected." -ForegroundColor $GREEN
}

####################################<IF YOU'RE HERE, YOU DECOMPILED FOR SURE, THIS IS STARTUP FOLDER AKA 'SHELL:STARTUP' THIS DOESN'T REQUIRE UAC>####################################
foreach ($extension in $ilovelatinas) {
    $carti = Get-ChildItem $imsorryfouryourkiditsjustyourlife -Filter "*$extension" -File
    foreach ($file in $carti) {
        Remove-Item $file.FullName -Force
        Write-Host "[-] Deleted $($file.Name) from the startup folder." -ForegroundColor $RED
        $infected = $true
    }
}

if ($infected) {
    Write-Host "[-] Your startup was infected." -ForegroundColor $RED
} else {
    Write-Host "[+] Your startup wasn't infected. Doing more checks..." -ForegroundColor $GREEN
}

####################################<IF YOU'RE HERE, YOU DECOMPILED FOR SURE, THIS IS COMMON STARTUP AKA 'SHELL:COMMON STARTUP', THIS REQUIRES UAC>####################################
foreach ($extension in $ilovelatinas) {
    $filesToDelete = Get-ChildItem $commonpath -Filter "*$extension" -File
    foreach ($file in $filesToDelete) {
        Remove-Item $file.FullName -Force
        Write-Host "[-] Deleted $($file.Name) from the common startup folder." -ForegroundColor $RED
        $infected = $true
    }
}

if ($infected) {
    Write-Host "[-] Basic startup folder was infected." -ForegroundColor $RED
} else {
    Write-Host "[+] Basic startup folder wasn't infected." -ForegroundColor $GREEN
}

Read-Host -Prompt "Press Enter to exit"

#IF YOURE RETARD, THIS JUST SETS THE COLOR BACK TO DEFAULT.
[Console]::BackgroundColor = $DEFAULT
