Write-Host "Congratulations! Your first script executed successfully"
Write-Host "WORKSPAC== $env:WORKSPACE  NUnitConsoleApp/NUnitConsoleApp.sln==== `n"
Set-Location -Path "$env:WORKSPACE/NUnitConsoleApp/NUnitConsoleApp.sln"
Write-Host "current loc = "Get-Location 

#New-Item -Path "..\" -Name "logfiles" -ItemType "directory"

