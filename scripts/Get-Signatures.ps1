# Specify paths
$Paths = @("$Env:LocalAppData\DocNGen", "$Env:LocalAppData\assembly\dl3", "$Env:LocalAppData\Apps\2.0")

$Paths = "$Env:LocalAppData\1Password"
# Get the files and present in Out-GridView
Get-ChildItem -Path $Paths -Recurse -Include "*.dll","*.exe" | ForEach-Object {
    Get-AuthenticodeSignature -FilePath $_.FullName | Select-Object -Property "Path", "Status", "StatusMessage"
} | Out-GridView
