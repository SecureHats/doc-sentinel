param (
    [parameter(Mandatory = $false)]
    [string]$FilesPath,
    
    [parameter(Mandatory = $false)]
    [string]$logLevel
)

## Make sure any modules we depend on are installed
$modulesToInstall = @(
    'xxx'
    'xxx'
)

$modulesToInstall | ForEach-Object {
    if (-not (Get-Module -ListAvailable -All $_)) {
        Write-Output "Module [$_] not found, INSTALLING..."
        Install-Module $_ -Force
    }
}

$modulesToInstall | ForEach-Object {
    Write-Output "Importing Module [$_]"
    Import-Module $_ -Force
}

# Setting Global variables
Write-Output 'Loading Mitre Att&ck framework'
$global:attack = (Get-ChildItem -Path "$($PSScriptRoot)\xxx.csv" -Recurse | Get-Content | ConvertFrom-CSV)

# Script contents
