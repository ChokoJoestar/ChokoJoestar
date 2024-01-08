param([switch]$Elevated)
function Test-Admin {
   $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
   $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false) {
   if ($elevated) {
      Write-Output "Elevating did not work :("
   }
   else {
      Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
   }
   exit
}
function makeLogFile {
   if (!(Test-Path C:\ChokoJoestar\Optimization.log -PathType Leaf)) {
      New-Item "C:\ChokoJoestar" -ItemType Directory
      New-Item "C:\ChokoJoestar\Optimization.log" -ItemType File
   }
}

function regeditModification {
   try {
      if (-NOT (Test-Path -LiteralPath "HKCU:\System\GameConfigStore")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Services\WbioSrvc")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Services\FontCache")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Services\FontCache3.0.0.0")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Services\GraphicsPerfSvc")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Services\stisvc")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Services\WerSvc")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Services\PcaSvc")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Services\Wecsvc")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\Control Panel\Desktop")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\System\GameConfigStore")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\GameBar")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\DirectX\UserGpuPreferences")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\Control Panel\Accessibility\MouseKeys")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\Control Panel\Accessibility\StickyKeys")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\Control Panel\Accessibility\Keyboard Response")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\Control Panel\Accessibility\ToggleKeys")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\Control Panel\International\User Profile")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Personalization\Settings")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\InputPersonalization")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\EventTranscriptKey")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Siuf\Rules")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling")) { return $false };
      if (-NOT (Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Control\Power")) { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\System\GameConfigStore' -Name 'GameDVR_FSEBehaviorMode' -ea SilentlyContinue) -eq 2) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\System\GameConfigStore' -Name 'GameDVR_HonorUserFSEBehaviorMode' -ea SilentlyContinue) -eq 1) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\System\GameConfigStore' -Name 'GameDVR_FSEBehavior' -ea SilentlyContinue) -eq 2) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\System\GameConfigStore' -Name 'GameDVR_DXGIHonorFSEWindowsCompatible' -ea SilentlyContinue) -eq 1) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Name 'NetworkThrottlingIndex' -ea SilentlyContinue) -eq -1) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Name 'SystemResponsiveness' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1' -Name 'Attributes' -ea SilentlyContinue) -eq '2') {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Services\WbioSrvc' -Name 'Start' -ea SilentlyContinue) -eq 4) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Services\FontCache' -Name 'Start' -ea SilentlyContinue) -eq 4) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Services\FontCache3.0.0.0' -Name 'Start' -ea SilentlyContinue) -eq 4) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Services\GraphicsPerfSvc' -Name 'Start' -ea SilentlyContinue) -eq 4) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Services\stisvc' -Name 'Start' -ea SilentlyContinue) -eq 4) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Services\WerSvc' -Name 'Start' -ea SilentlyContinue) -eq 4) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Services\PcaSvc' -Name 'Start' -ea SilentlyContinue) -eq 4) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Services\Wecsvc' -Name 'Start' -ea SilentlyContinue) -eq 4) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\Control Panel\Desktop' -Name 'AutoEndTasks' -ea SilentlyContinue) -eq '1') {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\Control Panel\Desktop' -Name 'HungAppTimeout' -ea SilentlyContinue) -eq '1000') {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\Control Panel\Desktop' -Name 'MenuShowDelay' -ea SilentlyContinue) -eq '8') {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\Control Panel\Desktop' -Name 'WaitToKillAppTimeout' -ea SilentlyContinue) -eq '2000') {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\Control Panel\Desktop' -Name 'LowLevelHooksTimeout' -ea SilentlyContinue) -eq '1000') {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync' -Name 'SyncPolicy' -ea SilentlyContinue) -eq 5) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization' -Name 'Enabled' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings' -Name 'Enabled' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials' -Name 'Enabled' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility' -Name 'Enabled' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows' -Name 'Enabled' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'EnableTransparency' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR' -Name 'value' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR' -Name 'AllowGameDVR' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\System\GameConfigStore' -Name 'GameDVR_Enabled' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR' -Name 'AppCaptureEnabled' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\GameBar' -Name 'AllowAutoGameMode' -ea SilentlyContinue) -eq 1) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\GameBar' -Name 'AutoGameModeEnabled' -ea SilentlyContinue) -eq 1) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers' -Name 'HwSchMode' -ea SilentlyContinue) -eq 2) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\DirectX\UserGpuPreferences' -Name 'DirectXUserGlobalSettings' -ea SilentlyContinue) -eq 'VRROptimizeEnable=0;') {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\Control Panel\Accessibility\MouseKeys' -Name 'Flags' -ea SilentlyContinue) -eq '0') {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\Control Panel\Accessibility\StickyKeys' -Name 'Flags' -ea SilentlyContinue) -eq '0') {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\Control Panel\Accessibility\Keyboard Response' -Name 'Flags' -ea SilentlyContinue) -eq '0') {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\Control Panel\Accessibility\ToggleKeys' -Name 'Flags' -ea SilentlyContinue) -eq '0') {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Name 'Enabled' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\Control Panel\International\User Profile' -Name 'HttpAcceptLanguageOptOut' -ea SilentlyContinue) -eq 1) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Start_TrackProgs' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338393Enabled' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-353694Enabled' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-353696Enabled' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy' -Name 'HasAccepted' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Personalization\Settings' -Name 'AcceptedPrivacyPolicy' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\InputPersonalization' -Name 'RestrictImplicitInkCollection' -ea SilentlyContinue) -eq 1) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\InputPersonalization' -Name 'RestrictImplicitTextCollection' -ea SilentlyContinue) -eq 1) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore' -Name 'HarvestContacts' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack' -Name 'ShowedToastAtLevel' -ea SilentlyContinue) -eq 1) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'AllowTelemetry' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy' -Name 'TailoredExperiencesWithDiagnosticDataEnabled' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\EventTranscriptKey' -Name 'EnableEventTranscript' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Siuf\Rules' -Name 'NumberOfSIUFInPeriod' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Siuf\Rules' -Name 'PeriodInNanoSeconds' -ea SilentlyContinue) -eq $null) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'PublishUserActivities' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'UploadUserActivities' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener' -Name 'Value' -ea SilentlyContinue) -eq 'Deny') {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location' -Name 'Value' -ea SilentlyContinue) -eq 'Deny') {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics' -Name 'Value' -ea SilentlyContinue) -eq 'Deny') {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation' -Name 'Value' -ea SilentlyContinue) -eq 'Deny') {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications' -Name 'GlobalUserDisabled' -ea SilentlyContinue) -eq 1) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name 'BackgroundAppGlobalToggle' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1' -Name 'Attributes' -ea SilentlyContinue) -eq 2) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e' -Name 'ACSettingIndex' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e' -Name 'DCSettingIndex' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c' -Name 'ACSettingIndex' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e' -Name 'ACSettingIndex' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e' -Name 'DCSettingIndex' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c' -Name 'ACSettingIndex' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching' -Name 'SearchOrderConfig' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power' -Name 'HiberbootEnabled' -ea SilentlyContinue) -eq 0) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling' -Name 'PowerThrottlingOff' -ea SilentlyContinue) -eq 1) {  } else { return $false };
      if ((Get-ItemPropertyValue -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control\Power' -Name 'HibernateEnabledDefault' -ea SilentlyContinue) -eq 0) {  } else { return $false };
   }
   catch { return $false }
   return $true
}

makeLogFile
Write-Host "Script d'optimisation by ChokoJoestar" > "C:\ChokoJoestar\Optimization.log"
Write-Host "Creation d'un point de restoration" > "C:\ChokoJoestar\Optimization.log"
powershell.exe -ExecutionPolicy Bypass -NoExit -Command "Checkpoint-Computer -Description 'Optimization-ByChoko' -RestorePointType 'MODIFY_SETTINGS'"
Write-Host "Modification du regedit" > "C:\ChokoJoestar\Optimization.log"
regeditModification
