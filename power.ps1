Write-Host "Congratulations! Your first script executed successfully"
$SolutionPath = "$env:WORKSPACE\NUnitConsoleApp"
Set-Location -Path $SolutionPath
Write-Host "ppppppppppppp"$SolutionPath

$abc = Get-Location 
Write-Host "current locA = $abc" 
$SolutionPathb = "NUnitConsoleApp"
Set-Location -Path $SolutionPathb
Write-Host "current loc = Get-Location"Get-Location

#New-Item -Path "..\" -Name "logfiles" -ItemType "directory"

