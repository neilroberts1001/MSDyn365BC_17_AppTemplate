$ContainerName = 'BC'
$ImageName = 'mcr.microsoft.com/businesscentral/sandbox'
$LicenseFile = '' #(Join-Path $PSSCriptRoot '..\fin.flf')

$Auth = 'NavUserPassword'
$Username = 'dev'
$Password = 'dev'
$IncludeCSide = $false
$EnableSymbolLoading = $false
$useBestContainerOS = $true
$updateHosts = $true
$CreateTestWebServices = $false
$Isolation = 'process'

#create object from app.json to get name
$AppJSON = Get-Content -Raw -Path (Join-Path $PSSCriptRoot '..\\MainApp\\app.json') | ConvertFrom-Json
$TestAppJSON = Get-Content -Raw -Path (Join-Path $PSSCriptRoot '..\\TestApp\\app.json') | ConvertFrom-Json
#get name of last compiled Ext.app package
$AppFile = (Get-ChildItem -Path (Join-Path $PSSCriptRoot '..\\MainApp') -Filter '*.app' | 
                    Sort-Object LastWriteTime -Descending |
                        Select-Object -First 1).Fullname
$TestAppFile = (Get-ChildItem -Path (Join-Path $PSSCriptRoot '..\\TestApp') -Filter '*.app' | 
Sort-Object LastWriteTime -Descending |
    Select-Object -First 1).Fullname
$RepoPath = (Join-Path $PSSCriptRoot '..')
$AppPath = (Join-Path $PSSCriptRoot '..\MainApp')
$TestAppPath = (Join-Path $PSSCriptRoot '..\TestApp')
