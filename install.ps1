$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
$LogFile = "C:\\ChokoJoestar\\Logs\\$(Get-Date -Format "dd-MM-yy_HH.mm.ss")_AfterReset.log"
$packages = @( 
    "python3",
    "7zip.install",
    "git.install",
    "filezilla",
    "spotify",
    "everything",
    "spicetify-cli",
    "vscode",
    "freedownloadmanager",
    "epicgameslauncher",
    "steam",
    "javadecompiler-gui",
    "javaruntime",
    "nodejs" 
)

function Init {
    $currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object System.Security.Principal.WindowsPrincipal($currentUser)
    $adminRole = [System.Security.Principal.WindowsBuiltInRole]::Administrator
    $isAdmin = $principal.IsInRole($adminRole)
    $directories = "C:\ChokoJoestar", "C:\ChokoJoestar\Logs"

    if (-not $isAdmin) {
        Write-Host "This script requires administrator privileges. Please run it as an administrator."
        Start-Sleep -Seconds 3
        Start-Process powershell.exe -Verb RunAs -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"$($MyInvocation.MyCommand.Path)`"")
        Exit
    }
    foreach ($dir in $directories) {
        if (!(Test-Path -Path $dir -PathType Container)) {
            New-Item -Path $dir -ItemType Directory -Force > $null
        }
    }
    if (!(Test-Path -Path $LogFile -PathType Leaf)) {
        New-Item -Path $LogFile -ItemType File -Force > $null
    }
}

function LogWrite {
    param (
        [string]$logString
    )
    $DateTime = "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
    $LogMessage = "$DateTime $logString"
    Add-Content -Path $LogFile -Value $LogMessage
}

function WriteLogAndOutput {
    param (
        [string]$logString
    )
    LogWrite $logString
    Write-Output $logString
}

function Install-Chocolatey {
    WriteLogAndOutput "Verifying Chocolatey is installed"
    if (!(Test-Path "$env:ProgramData\chocolatey\choco.exe")) {
        WriteLogAndOutput "Installing Chocolatey..."
        try {
            Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
        }
        catch {
            WriteLogAndOutput $_.Exception.Message
        }
    }
    else {
        WriteLogAndOutput "Chocolatey is already installed"
    }
}

function Show-Menu {
    Clear-Host
    Write-Host "================ AfterReset ================"
    Write-Host "1: Press '1' to install applications"
    Write-Host "2: Press '2' to change the regedit"
    Write-Host "Q: Press 'Q' to quit"
}

function Show-SubMenu-Install {
    Clear-Host
    Write-Host "================ Installer ================"
    Write-Host "1: Press '1' to install Choco's package"
    Write-Host "2: Press '2' to install Spicetify (CLI & Marketplace)"
    Write-Host "3: Press '3' to install Vencord"
    Write-Host "Q: Press 'Q' to quit"
}

Init
do {
    Show-Menu
    $Option = Read-Host "Please choose an option"
    switch ($Option) {
        '1' {
            do {
                Show-SubMenu-Install
                $installOption = Read-Host "Please choose an option"
                switch ($installOption) {
                    '1' {
                        # Install apps with Chocolatey
                        Install-Chocolatey
                        $continue = $true
                        while ($continue) {
                            $input = Read-Host "Do you want to add a package to install? (Y/N)"
                            if ($input -eq "Y" -or $input -eq "y") {
                                $newPackage = Read-Host "Enter the package name (choco)"
                                $packages += $newPackage
                            }
                            elseif ($input -eq "N" -or $input -eq "n") {
                                $continue = $false
                            }
                            else {
                                Write-Host "Invalid input. Please enter 'Y' for Yes or 'N' for No."
                            }
                        }
                        foreach ($package in $packages) {
                            choco install $package -y > $null
                            WriteLogAndOutput "$package was installed."
                        }
                    }
                    '2' {
                        # Install Spicetify
                        $SpicetifyInstall = "C:\ChokoJoestar\Install\SpicetifyInstall.ps1"
                        $SpicetifyMarketplaceInstall = "C:\ChokoJoestar\Install\SpicetifyMarketplaceInstall.ps1"
                        $installPaths = @($SpicetifyInstall, $SpicetifyMarketplaceInstall)
                        $urls = @("https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.ps1", "https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/resources/install.ps1")

                        foreach ($i in 0..1) {
                            if (!(Test-Path -Path "C:\ChokoJoestar\Install" -PathType Container)) {
                                New-Item "C:\ChokoJoestar\Install" -ItemType Directory -Force > $null
                            }
                            WriteLogAndOutput "Downloading Spicetify setup..."
                            powershell.exe Invoke-WebRequest -Uri $urls[$i] -OutFile $installPaths[$i] > $null
                            WriteLogAndOutput "Downloading of Spicetify setup was successful."
                            WriteLogAndOutput "Installing Spicetify setup..."
                            Invoke-Expression $installPaths[$i] > $null
                            WriteLogAndOutput "Spicetify setup installed successfully."
                        }
                        WriteLogAndOutput "Applying the patch..."
                        spicetify.exe update backup apply
                        WriteLogAndOutput "Patch applied successfully."
                    }
                    '3' {
                        # Install Vencord using Vencord-CLI
                        $VencordCLI = "C:\ChokoJoestar\Install\VencordInstallCLI.exe"
                        $VencordURL = "https://github.com/Vencord/Installer/releases/latest/download/VencordInstallerCli.exe"
                        
                        if (!(Test-Path -Path "C:\ChokoJoestar\Install" -PathType Container)) {
                            New-Item "C:\ChokoJoestar\Install" -ItemType Directory -Force > $null
                        }
                        WriteLogAndOutput "Downloading Vencord CLI..."
                        powershell.exe Invoke-WebRequest -Uri $VencordURL -OutFile $VencordCLI > $null
                        WriteLogAndOutput "Downloading of Vencord CLI was successful."
                        WriteLogAndOutput "Applying the patch..."
                        & $VencordCLI -update-self | & $VencordCLI -install | & $VencordCLI -repair
                        WriteLogAndOutput "Patch applied successfully."
                    }
                }
                Pause
            } until ($installOption -eq 'Q' -or $installOption -eq 'q')
        }
        '2' { 
            # Install regedit and add to the system
            $regFile = "C:\ChokoJoestar\Install\regedit.reg"
            $regeditURL = "https://raw.githubusercontent.com/ChokoJoestar/ChokoJoestar/main/regedit.reg"
            
            if (!(Test-Path -Path "C:\ChokoJoestar\Install" -PathType Container)) {
                New-Item "C:\ChokoJoestar\Install" -ItemType Directory -Force > $null
            }
            WriteLogAndOutput "Downloading regedit..."
            powershell.exe Invoke-WebRequest -Uri $regeditURL -OutFile $regFile > $null
            WriteLogAndOutput "Downloading of regedit was successful."
            WriteLogAndOutput "Applying the regedit..."
            reg.exe import $regFile
            WriteLogAndOutput "Regedit applied successfully."
        }
    }
    Pause
} until ($Option -eq 'Q' -or $Option -eq 'q')