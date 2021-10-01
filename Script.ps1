function setParamValues{
Param
    (
        $script:SolutionPath,
        $script:NUnitConsoleExecutable,
		$script:ExtentExecutable,

		$script:DoxyConfig,
		$script:DoxyExecutable,
		$script:GraphvizExecutablePath

    )

}
Set-Location -Path $env:WORKSPACE
$script:ProjectName = "NUnitConsoleApp"
$script:SolutionPath = "$ProjectName/NUnitConsoleApp.sln"  
$script:ProjectPath = "$ProjectName/NUnitConsoleApp/bin/Debug/netcoreapp3.1/ConsoleApp1.dll"
$script:MSBuildPath = "\Windows\Microsoft.NET\Framework64\v3.5"

$script:OutputDirectory = "results"
$script:NUnitConsoleExecutable = "packages\NUnit.ConsoleRunner.3.12.0"
$script:ExtentExecutable = "packages\extent.0.0.3"
$script:DoxyConfig = "",
$script:DoxyExecutable = "packages\Doxygen.1.8.14\tools"
$script:GraphvizExecutable = "packages\Graphviz.2.38.0.2\lib\Graphviz.dll"



# Create packages folder under parent project folder
New-Item -Path $ProjectName -Name "packages" -ItemType "directory"

#Install Nuget 
$sourceNugetExe = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
$NugetExe = "packages\nuget.exe"
Invoke-WebRequest $sourceNugetExe -OutFile $NugetExe
Set-Alias nuget $targetNugetExe -Scope Global -Verbose

# Need to install dependencies : NUnit.ConsoleRunner,extent,Doxygen and DotTool(Graphviz) .
Set-Location -Path "packages"
Install-Package NUnit.ConsoleRunner -RequiredVersion 3.12.0
Install-Package extent -RequiredVersion 0.0.3
Install-Package Doxygen -RequiredVersion 1.8.14
Install-Package Graphviz -RequiredVersion 2.38.0.2

# Run MSBuild with installed windows msbuild

<# Uncomment this section if you want to build. I believe MSBuild already been used in the pipeline.
Set-Location -Path $MSBuildPath
msbuild $SolutionPath
#>

# Run nunit that output XML output
# command: {nunit-console runner path}>nunit3-console /work:{folder location for output} {path to project to run}
Set-Location -Path $NUnitConsoleExecutable
nunit3-console /work:$OutputDirectory $ProjectPath

# Run extent report to generate html report in specified path '
# command: {extent path}> extent -i {source path for xml file location} -o {destination folder for generated report}
Set-Location -Path $ExtentExecutable
extent -i $OutputDirectory+"TestResult.xml" -o $OutputDirectory

#
# {doxygen_path}> .\doxygen.exe -g {location to config file to generate}
Set-Location -Path $DoxyExecutable
.\doxygen.exe -g $DoxyConfig

# {doxygen_path}> .\doxygen.exe -g {location to config file generated}
.\doxygen.exe $DoxyConfig


# PROJECT_LOGO =

# DOT_PATH = C:\Program Files\Graphviz\bin specify the path where the dot tool(graphviz) is installed

#setParamValues $script:SolutionPath "A" "B" "C" "D" "E" "F"