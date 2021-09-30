function setParamValues{
Param
    (
         [string] $script:SolutionPath,
[string] $script:SolutionName,
         [string] $script:NUnitConsoleExecutable,
[string] $script:ExtentExecutable,

[string] $script:DoxyConfig,
[string] $script:DoxyExecutable,
[string] $script:GraphvizExecutablePath


    )



}

#setParamValues -SolutionPath "aa//bb//cc"  -SolutionName "" -NUnitConsoleExecutable "${env.WORKSPACE}\packages\NUnit.ConsoleRunner.3.12.0\tools\nunit3-console.exe"  -ExtentExecutable  "${env.WORKSPACE}packages\extent.0.0.3\tools\extent.exe" -DoxyConfig "C:\Temp\DoxygenTest\bundlemanager-poc.config"  -DoxyExecutable "${env.WORKSPACE}\packages\Doxygen.1.8.14\tools" -GraphvizExecutablePath "C:\Program Files\Graphviz\bin"

$script:SolutionPath = "$env:WORKSPACE/ConsoleApp1.sln"   #${env.WORKSPACE}
$script:ProjectPath = "$env:WORKSPACE/bin/Debug/netcoreapp3.1/ConsoleApp1.dll"
$script:SolutionName = $env.JOB_NAME
$script:MSBuildPath = $env:SystemRoot"/Microsoft.NET/Framework\v3.5"

$script:OutputDirectory = "results"
$script:NUnitConsoleExecutable = "$env:WORKSPACE/packages/NUnit.ConsoleRunner.3.12.0"
$script:ExtentExecutable = "../packages/extent.0.0.3"
$script:DoxyConfig = "DoxygenTest\bundlemanager-poc.config",
$script:DoxyPath = "$env:WORKSPACE/packages\Doxygen.1.8.14\tools"
$script:DoxyExecutable = "$env:WORKSPACE/packages\Doxygen.1.8.14\tools\doxygen.exe",
$script:GraphvizExecutable = "$env:WORKSPACE/packages\Graphviz.2.38.0.2\lib\Graphviz.dll"


$sourceNugetExe = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
$NugetExe = "../packages/nuget.exe"
Invoke-WebRequest $sourceNugetExe -OutFile $NugetExe
Set-Alias nuget $targetNugetExe -Scope Global -Verbose

# Need to install dependencies : NUnit.ConsoleRunner,extent,Doxygen and DotTool(Graphviz) .
Set-Location -Path "../packages"
Install-Package NUnit.ConsoleRunner -MinimumVersion 3.12.0
Install-Package extent -MinimumVersion 0.0.3

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

# Using Doxygen by adding in Package Manager
Set-Location -Path "../packages"
Install-Package Doxygen

#
# {doxygen_path}> .\doxygen.exe -g {location to config file to generate}
Set-Location -Path $DoxyPath
.\doxygen.exe -g $DoxyConfig
# Update OUTPUT_DIRECTORY in bundlemanager-poc.config file
# {doxygen_path}> .\doxygen.exe -g {location to config file generated}
.\doxygen.exe $DoxyConfig

# Install Graphviz
Set-Location -Path "../packages"
Install-Package Graphviz

# PROJECT_LOGO =
# Enable HAVE_DOT = YES in bundlemanager-poc.config file for enabling graphviz
# DOT_PATH = C:\Program Files\Graphviz\bin specify the path where the dot tool(graphviz) is installed

#setParamValues $script:SolutionPath "A" "B" "C" "D" "E" "F"