Write-Host "Congratulations! Your first script executed successfully"
$SolutionPath = "$env:WORKSPACE\NUnitConsoleApp"
Set-Location -Path $SolutionPath




$SolutionPathb = "NUnitConsoleApp"
Set-Location -Path $SolutionPathb
$abc = Get-Location 
Write-Host "current locA = $abc" 
Write-Host "current loc = Get-Location"Get-Location

#New-Item -Path "..\" -Name "logfiles" -ItemType "directory"

