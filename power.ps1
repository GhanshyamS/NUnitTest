Write-Host "Congratulations! Your first script executed successfully"
#Write-Host "WORKSPAC== $env:WORKSPACENUnitConsoleApp/NUnitConsoleApp.sln==== `n"
$SolutionPath = $env:WORKSPACE"\NUnitConsoleApp"
#Set-Location -Path $SolutionPath
Write-Host "ppppppppppppp"$SolutionPath

Write-Host "current locA = " Get-Location 
$SolutionPathb = "NUnitConsoleApp"
Set-Location -Path $SolutionPathb
Write-Host "current loc = " Get-Location 

#New-Item -Path "..\" -Name "logfiles" -ItemType "directory"

