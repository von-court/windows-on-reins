
Function ServiceChange($service, $startupType) {
    if($startupType -eq "Disabled") {
        Stop-Service $service -Force -NoWait
        Write-Output ("Service $($service) stopped")
    }
	Get-Service $service | Set-Service -StartupType $startupType	
    Write-Output ("Service $($service) set to startup type $($startupType)")
    if($startupType -eq "Automatic") {
        Start-Service $service -Force -NoWait 
        Write-Output ("Service $($service) started")
    }
}

ServiceChange "DPS" "Disabled"
ServiceChange "TrkWks" "Disabled"
ServiceChange "Fax" "Disabled"
ServiceChange "vmicguestinterface" "Disabled"
ServiceChange "SharedAccess" "Disabled"
ServiceChange "iphlpsvc" "Disabled"
ServiceChange "MSDTC" "Disabled"
ServiceChange "netprofm" "Disabled"
ServiceChange "WpcMonSvc" "Disabled"
ServiceChange "Spooler" "Disabled"
ServiceChange "PcaSvc" "Disabled"
ServiceChange "RasAuto" "Disabled"
ServiceChange "RasMan" "Disabled"
ServiceChange "seclogon" "Disabled"
ServiceChange "SCardSvr" "Disabled"
ServiceChange "lmhosts" "Disabled"
ServiceChange "UsoSvc" "AutomaticDelayedStart"
ServiceChange "eventlog" "Disabled"
ServiceChange "icssvc" "Disabled"
ServiceChange "ZoomCptService" "Disabled"