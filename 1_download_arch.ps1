$BasePath = $env:USERPROFILE + "\wsl"

if (!(Test-Path $BasePath)){
  New-Item $BasePath -ItemType Directory
}
Set-Location $BasePath

$githubLatestReleases = "https://api.github.com/repos/yuk7/ArchWSL/releases/latest"   
$githubLatestReleasesJson = ((Invoke-WebRequest $gitHubLatestReleases) | ConvertFrom-Json).assets.browser_download_url  
$Uri = $githubLatestReleasesJson | Where-Object {$_ -like "*Arch_Online.zip*"}
Invoke-WebRequest -Uri $Uri -OutFile $BasePath\Arch.zip

Expand-Archive -Path $BasePath\Arch.zip -DestinationPath $BasePath\Arch\
Set-Location $BasePath\Arch\
.\Arch.exe