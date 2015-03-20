<#
Get-MappedDrives v2.1
Developed by Arjun Dhanjal
March 2015

Usage: .\Get-MappedDrives.ps1 -ComputerName <Workstation Name> -SamAccountName <Target User>

CHANGELOG:
  v2: Script rewritten from batch file to PowerShell script.
  v1: Original script written as a *.bat.
#>

[CmdletBinding()]
	PARAM(
		[Parameter(Mandatory=$true, HelpMessage=" ")]
		[string]$ComputerName,
		[Parameter(Mandatory=$true, HelpMessage=" ")]
		[string]$SamAccountName
	)

Write-Host "Drives currently mapped on ${ComputerName} for user ${SamAccountName}:"
$Mapped = Get-WmiObject -Class "Win32_MappedLogicalDisk" -Namespace "root\CIMV2" -ComputerName $ComputerName | Select DeviceID,ProviderName
ForEach ($drive in $mapped) {
  Write-Host -NoNewLine $drive.DeviceID "" -ForegroundColor Cyan
  Write-Host $drive.ProviderName -ForegroundColor Green
}

Write-Host "Press any key to continue..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp")
