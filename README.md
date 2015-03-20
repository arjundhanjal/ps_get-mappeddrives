# Get-MappedDrives.ps1

This script is designed to retrieve any mapped drives for the **currently logged-on user** on a domain machine.

## The process

1. Querying Win32_MappedLogicalDisk

   First, the script queries WMI class `Win32_MappedLogicalDisk` and pulls out `DeviceID` and `ProviderName`; i.e., the drive letter and the UNC path to the network share.

2. Outputting the drives to `STDOUT`

   The script is then designed to output the information to read `X: \\UNC\path\to\netshare`.

## Other notes

At this time, the script gets finnicky when there are multiple logged on users. Also, this script cannot be executed by using `Enter-PSSession`, as the script will pull any drives that are supposed to be mapped for the authenticated user.

This script is best used in (enterprise) environments where the administrator has remote access to the user's profile and can execute the script *as the user*. This is particularly useful when rebuilding a user's profile or upgrading their machine. There are many instances where not all network drives are mapped through GPO, and so it is important for user functionality to restore these drives as best as possible.
