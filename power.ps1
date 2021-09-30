Write-Host "Congratulations! Your first script executed successfully"
Get-Location
$SolutionPath = "$env:WORKSPACE\NUnitConsoleApp"
Set-Location -Path $SolutionPath




$SolutionPathb = "UnitConsoleApp"
Set-Location -Path $SolutionPathb
$abc = Get-Location 

#New-Item -Path "..\" -Name "logfiles" -ItemType "directory"

