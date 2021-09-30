Write-Host "Congratulations! Your first script executed successfully"
Write-Host "WORKSPAC== $env:WORKSPACE\NUnitConsoleApp\NUnitConsoleApp.sln==== `n"
$SolutionPath = "$env:WORKSPACE\NUnitConsoleApp"
Set-Location -Path $SolutionPath
Write-Host "ppppppppppppp"$SolutionPath

$abc = Get-Location 
Write-Host "current locA = $abc" 
$SolutionPathb = "NUnitConsoleApp"
Set-Location -Path $SolutionPathb
Write-Host "current loc = $SolutionPathb"

#New-Item -Path "..\" -Name "logfiles" -ItemType "directory"

