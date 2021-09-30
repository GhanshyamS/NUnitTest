Write-Host "Congratulations! Your first script executed successfully"
Write-Host "WORKSPACE var == $env:WORKSPACE ===="
#New-Item ItemType "directory" -Force -Path ".\Teset"
New-Item -Path "..\" -Name "logfiles" -ItemType "directory"

