<#
    .SYNOPSIS
    Script used by Create-Policies.ps1 to identify EXE files that should be disallowed by AppLocker for non-admin use. Can be edited if necessary.

    .DESCRIPTION
    This script outputs a list of file paths under %windir% that need to be specifically disallowed by AllowListing rules.
    The list of files is consumed by Create-Policies.ps1, which builds the necessary AppLocker rules to block them.
    You can edit this file as needed for your environment, although it is recommended that none of the programs
    identified in this script be removed.

    Note: the solution also blocks the loading of PowerShell v2 modules - these blocks are hardcoded into the base XML file. This module
    as currently designed can block only EXE files, not DLLs.
    http://www.leeholmes.com/blog/2017/03/17/detecting-and-preventing-powershell-downgrade-attacks/
#>

# --------------------------------------------------------------------------------
# Files used to bypass AllowListing:

# Find the multiple instances of .NET executables that have been identified as AllowList bypasses.
# Create-Policies.ps1 will remove redundant information.

# https://learn.microsoft.com/en-us/windows/security/application-security/application-control/windows-defender-application-control/design/applications-that-can-bypass-wdac

$Files = @("addinprocess.exe",
    "addinprocess32.exe",
    "addinutil.exe",
    "aspnet_compiler.exe",
    "bash.exe",
    "bginfo.exe",
    "cdb.exe",
    "cscript.exe",
    "cipher.exe",
    "certreq.exe",
    "certutil.exe",
    "Cmdl32.exe",
    "msdt.exe"
    "csi.exe",
    "dbghost.exe",
    "dbgsvc.exe",
    "dnx.exe",
    "dotnet.exe",
    "fsi.exe",
    "fsiAnyCpu.exe",
    "infdefaultinstall.exe",
    "kd.exe",
    "kill.exe",
    "lxssmanager.dll",
    "lxrun.exe",
    "Microsoft.Build.dll",
    "Microsoft.Build.Framework.dll",
    "Microsoft.Workflow.Compiler.exe",
    "msbuild.exe2",
    "msbuild.dll",
    "mshta.exe",
    "ntkd.exe",
    "ntsd.exe",
    "powershellcustomhost.exe",
    "PresentationHost.exe",
    "rcsi.exe",
    "runas.exe",
    "runscripthelper.exe",
    "texttransform.exe",
    "visualuiaverifynative.exe",
    "system.management.automation.dll",
    "wfc.exe",
    "windbg.exe",
    "wmic.exe",
    "wscript.exe",
    "wsl.exe",
    "wslconfig.exe",
    "wslhost.exe")
Get-ChildItem -Path "$Env:SystemRoot" -Include $Files -Recurse -ErrorAction "SilentlyContinue" | `
    Select-Object -ExpandProperty "FullName" 
