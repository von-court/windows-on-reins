
Function RegChange($desc, $path, $thing, $value, $type) {
	Write-Output ($desc)	
	
   # String: Specifies a null-terminated string. Equivalent to REG_SZ.
   # ExpandString: Specifies a null-terminated string that contains unexpanded references to environment variables that are expanded when the value is retrieved. Equivalent to REG_EXPAND_SZ.
   # Binary: Specifies binary data in any form. Equivalent to REG_BINARY.
   # DWord: Specifies a 32-bit binary number. Equivalent to REG_DWORD.
   # MultiString: Specifies an array of null-terminated strings terminated by two null characters. Equivalent to REG_MULTI_SZ.
   # Qword: Specifies a 64-bit binary number. Equivalent to REG_QWORD.
   # Unknown: Indicates an unsupported registry data type, such as REG_RESOURCE_LIST.

	$type2 = "String"
	if (-not ([string]::IsNullOrEmpty($type)))
	{
		$type2 = $type
	}
	
	If (!(Test-Path ("HKLM:\" + $path))) {
		New-Item -Path ("HKLM:\" + $path) -Force | out-null
	}
	If (!(Test-Path ("HKCU:\" + $path))) {
        New-Item -Path ("HKCU:\" + $path) -Force | out-null
    }
	
    If (Test-Path ("HKLM:\" + $path)) {
        Set-ItemProperty ("HKLM:\" + $path) $thing -Value $value -Type $type2 -PassThru:$false | out-null
    }
	If (Test-Path ("HKCU:\" + $path)) {
        Set-ItemProperty ("HKCU:\" + $path) $thing -Value $value -Type $type2 -PassThru:$false | out-null
    }	

}

RegChange "Search in Task Bar" "Software\Policies\Microsoft\Windows\Windows Search" "searchOntaskbarMode" "0" "DWord"
RegChange "Windows Update enabled" "Software\Policies\Microsoft\Windows\WindowsUpdate" "NoAutoUpdate" "0" "DWord"
RegChange "Disabling Windows Update to include updates that have a Driver classification" "Software\Policies\Microsoft\Windows\WindowsUpdate" "ExcludeWUDriversInQualityUpdate" "1" "DWord"
RegChange "Cortana" "Software\Policies\Microsoft\Windows\Windows Search" "AllowCortana" "0" "DWord"
RegChange "MSDTC (Distributed Transaction Co.)" "System\CurrentControlSet\Services\MSDTC" "Start" "2" "DWord"
RegChange "Widgets button on taskbar" "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarDa" "0" "DWord"
RegChange "Chat button on taskbar" "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarMn" "0" "DWord"
RegChange "Virtual Desktops" "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "ShowTaskViewButton" "0" "DWord"