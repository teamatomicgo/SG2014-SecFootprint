


function Invoke-SecurityScan([string[]]$computername) {
	
	Write-Output $computername
	Get-MountPoints $computername
	Get-EnvVars $computername
	
}

function Get-MountPoints ([string]$computername) {
	$HostDrives = Get-WmiObject -Class Win32_LogicalDisk -ComputerName $computername -Filter "DriveType=3" | ForEach-Object {$_.DeviceID}
	$HostShares = Get-WmiObject -Class Win32_Share -ComputerName $computername
	Write-Output $HostDrives
	Write-Output $HostShares
}

function Get-EnvVars ($computername) {
	$HostEnvVars = Get-WmiObject -Class Win32_Environment -ComputerName $computername
	Write-Output $HostEnvVars
}

function Get-HostShares ($co) {
	
}
Invoke-SecurityScan "."