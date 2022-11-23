# Specify paths
$Paths = @("$Env:LocalAppData\DocNGen", "$Env:LocalAppData\assembly\dl3", "$Env:LocalAppData\Apps\2.0")

# Get files and export to CSV
Get-ChildItem -Path $Paths -Recurse -Filter "*.dll" | ForEach-Object {
    Get-AuthenticodeSignature -FilePath $_.FullName | Select-Object -Property "Path", "Status", "StatusMessage"
} | Export-Csv -Path .\Signed.csv -Delimiter ","

# Get the files and present in Out-GridView
Get-ChildItem -Path $Paths -Recurse -Filter "*.exe" | ForEach-Object {
    Get-AuthenticodeSignature -FilePath $_.FullName | Select-Object -Property "Path", "Status", "StatusMessage"
} | Out-GridView
