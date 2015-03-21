<#
Get-MappedDrives.ps1 (v2.1)
Copyright (C) 2015  Arjun Dhanjal

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

Contact information available at ArjunDhanjal.com

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
