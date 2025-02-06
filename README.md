# AppLocker

AppLocker baseline configuration using the [AaronLocker](https://github.com/microsoft/AaronLocker) module with customisations. Used for testing AppLocker and Microsoft Defender Application Control with Windows 10, Intune etc.

## Additional configurations

### Inbox executables

Additional inbox executables that Microsoft recommends blocking are found here: [Microsoft recommended block rules](https://learn.microsoft.com/en-us/windows/security/application-security/application-control/app-control-for-business/design/applications-that-can-bypass-appcontrol). These files can be tested for and formatting for adding to `GetExeFilesToDenyList.ps1` with:

```powershell
$Files = @("addinprocess.exe",
"addinprocess32.exe",
"addinutil.exe",
"aspnet_compiler.exe",
"bash.exe",
"bginfo.exe",
"cdb.exe",
"cscript.exe",
"csi.exe",
"dbghost.exe",
"dbgsvc.exe",
"dbgsrv.exe",
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
"msbuild.exe",
"msbuild.dll",
"mshta.exe",
"ntkd.exe",
"ntsd.exe",
"powershellcustomhost.exe",
"rcsi.exe",
"runscripthelper.exe",
"texttransform.exe",
"visualuiaverifynative.exe",
"system.management.automation.dll",
"webclnt.dll",
"davsvc.dll",
"wfc.exe",
"windbg.exe",
"wmic.exe",
"wscript.exe",
"wsl.exe",
"wslconfig.exe",
"wslhost.exe")

$Executables = @()
Get-ChildItem -Path "$Env:SystemRoot\Microsoft.NET" -Include $files -Recurse -ErrorAction "SilentlyContinue" | ForEach-Object { $Executables += $_ }
$Executables | Select-Object -ExpandProperty "FullName" | Select-Object -Unique | Sort-Object | Set-Clipboard
```
