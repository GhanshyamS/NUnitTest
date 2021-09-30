Write-Host "Congratulations! Your first script executed successfully"
Write-Host "WORKSPAC== $env:WORKSPACE ==== Job name = $env:JOB_NAME"
New-Item -Path "..\" -Name "logfiles" -ItemType "directory"

