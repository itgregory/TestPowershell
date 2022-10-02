### Hash table of all lines
$TubeLines = $null
$TubeLines = @{}
$Request = ConvertFrom-JSON (Invoke-WebRequest -Uri "https://api.tfl.gov.uk/Line/Mode/tube/Status")
$ListTubeLines = $Request | select-object id, name
$ListTubeId = $Request.id

foreach ($l in $ListTubeId) {
    $url = $null
    $stat = $null
    $statresult = $null
    $url = "https://api.tfl.gov.uk/Line/" + $l
    $stat = $request | where-object {$_.id -eq $l}
    $statresult = $stat.lineStatuses.statusSeverityDescription
    $TubeLines.add($l,$statresult)
}

### Create function for user menu
function Show-TubeLines
{
    param (
        [string]$Title = 'List of all Tube Lines'
    )

    Clear-Host
    Write-Host "== $Title =="

    Write-Host "1: Press '1' for Bakerloo line."
    Write-Host "2: Press '2' for Central line."
    Write-Host "3: Press '3' for Hammersmith & City line."
    Write-Host "4: Press '4' for Victoria line."
    Write-Host "5: Press '5' for Jubilee line."
    Write-Host "6: Press '6' for Metropolitan line."
    Write-Host "7: Press '7' for District line."
    Write-Host "8: Press '8' for Piccadilly line."
    Write-Host "9: Press '9' for Waterloo & City line."
    Write-Host "10: Press '10' for Circle line."
    Write-Host "11: Press '11' for Northern line."
    Write-Host "12: Press '12' for All lines"
    Write-Host "Q: Press 'Q' to quit"
}

$StartDate = $null
$StartDate = Read-Host -Prompt "Provide start date yyyy-mm-dd for planned works for current issues press 'Enter')"

if ($StartDate -ne "" ) {
    $EndDate = Read-Host -Prompt "Provide End Date"
    do
{
    Show-TubeLines 
    $selection = Read-Host "Please make selection"
    switch ($selection)
    {
        '1' {
            $planned1 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/bakerloo/Status/$StartDate/to/$EndDate"
            write-Host $planned1.lineStatuses.reason -ForegroundColor Yellow
        } '2' {
            $planned2 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/Central/Status/$StartDate/to/$EndDate"
            write-Host $planned2.lineStatuses.reason -ForegroundColor Yellow
        } '3' {
            $planned3 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/hammersmith-city/Status/$StartDate/to/$EndDate"
            write-Host $planned3.lineStatuses.reason -ForegroundColor Yellow
        } '4' {
            $planned4 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/Victoria/Status/$StartDate/to/$EndDate"
            write-Host $planned4.lineStatuses.reason -ForegroundColor Yellow
        } '5' {
            $planned5 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/Jubilee/Status/$StartDate/to/$EndDate"
            write-Host $planned5.lineStatuses.reason -ForegroundColor Yellow
        } '6' {
            $planned6 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/Metropolitan/Status/$StartDate/to/$EndDate"
            write-Host $planned6.lineStatuses.reason -ForegroundColor Yellow
        } '7' {
            $planned7 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/District/Status/$StartDate/to/$EndDate"
            write-Host $planned7.lineStatuses.reason -ForegroundColor Yellow
        } '8' {
            $planned8 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/Piccadilly/Status/$StartDate/to/$EndDate"
            write-Host $planned8.lineStatuses.reason -ForegroundColor Yellow
        } '9' {
            $planned9 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/waterloo-city/Status/$StartDate/to/$EndDate"
            write-Host $planned9.lineStatuses.reason -ForegroundColor Yellow
        } '10' {
            $planned10 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/Circle/Status/$StartDate/to/$EndDate"
            write-Host $planned10.lineStatuses.reason -ForegroundColor Yellow
        } '11' {
            $planned11 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/Northern/Status/$StartDate/to/$EndDate"
            write-Host $planned11.lineStatuses.reason -ForegroundColor Yellow
        } '12' {
            $planned1 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/bakerloo/Status/$StartDate/to/$EndDate"
            $planned2 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/Central/Status/$StartDate/to/$EndDate"
            $planned3 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/hammersmith-city/Status/$StartDate/to/$EndDate"
            $planned4 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/Victoria/Status/$StartDate/to/$EndDate"
            $planned5 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/Jubilee/Status/$StartDate/to/$EndDate"
            $planned6 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/Metropolitan/Status/$StartDate/to/$EndDate"
            $planned7 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/District/Status/$StartDate/to/$EndDate"
            $planned8 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/Piccadilly/Status/$StartDate/to/$EndDate"
            $planned9 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/waterloo-city/Status/$StartDate/to/$EndDate"
            $planned10 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/Circle/Status/$StartDate/to/$EndDate"
            $planned11 = Invoke-RestMethod -Uri "https://api.tfl.gov.uk/Line/Northern/Status/$StartDate/to/$EndDate"
            write-Host $planned1.lineStatuses.reason -ForegroundColor Yellow
            write-Host $planned2.lineStatuses.reason -ForegroundColor Yellow
            write-Host $planned3.lineStatuses.reason -ForegroundColor Yellow
            write-Host $planned4.lineStatuses.reason -ForegroundColor Yellow
            write-Host $planned5.lineStatuses.reason -ForegroundColor Yellow
            write-Host $planned6.lineStatuses.reason -ForegroundColor Yellow
            write-Host $planned7.lineStatuses.reason -ForegroundColor Yellow
            write-Host $planned8.lineStatuses.reason -ForegroundColor Yellow
            write-Host $planned9.lineStatuses.reason -ForegroundColor Yellow
            write-Host $planned10.lineStatuses.reason -ForegroundColor Yellow
            write-Host $planned11.lineStatuses.reason -ForegroundColor Yellow

        } default {'Q'}
    }
    Pause
}
until ($selection -eq 'q')
} else {
do
{
    Show-TubeLines 
    $selection = Read-Host "Please make selection"
    switch ($selection)
    {
        '1' {
            $IssuesBakerloo = Invoke-RestMethod -Uri 'https://api.tfl.gov.uk/Line/bakerloo/Disruption'
            if ($IssuesBakerloo.description -match 'Line') {write-host $IssuesBakerloo.description -ForegroundColor Red} else {write-host "Good Service on Bakreloo Line" -ForegroundColor Green}
        } '2' {
            $IssuesCentral = Invoke-RestMethod -Uri 'https://api.tfl.gov.uk/Line/Central/Disruption'
            if ($IssuesCentral.description -match 'Line') {write-host $IssuesCentral.description -ForegroundColor Red} else {write-host "Good Service on Central Line" -ForegroundColor Green}
        } '3' {
            $IssuesHC = Invoke-RestMethod -Uri 'https://api.tfl.gov.uk/Line/hammersmith-city/Disruption'
            if ($IssuesCentral.description -match 'Line') {write-host $IssuesHC.description -ForegroundColor Red} else {write-host "Good Service on Waterloo & City Line" -ForegroundColor Green}
        } '4' {
            $IssuesVictoria = Invoke-RestMethod -Uri 'https://api.tfl.gov.uk/Line/Victoria/Disruption'
            if ($IssuesVictoria.description -match 'Line') {write-host $IssuesVictoria.description -ForegroundColor Red} else {write-host "Good Service on Victoria Line" -ForegroundColor Green}
        } '5' {
            $IssuesJubilee = Invoke-RestMethod -Uri 'https://api.tfl.gov.uk/Line/Jubilee/Disruption'
            if ($IssuesJubilee.description -match 'Line') {write-host $IssuesJubilee.description -ForegroundColor Red} else {write-host "Good Service on Jubilee Line" -ForegroundColor Green}
        } '6' {
            $IssuesMetropolitan = Invoke-RestMethod -Uri 'https://api.tfl.gov.uk/Line/Metropolitan/Disruption'
            if ($IssuesMetropolitan.description -match 'Line') {write-host $IssuesMetropolitan.description -ForegroundColor Red} else {write-host "Good Service on Metropolitan Line" -ForegroundColor Green}
        } '7' {
            $IssuesDistrict = Invoke-RestMethod -Uri 'https://api.tfl.gov.uk/Line/District/Disruption'
            if ($IssuesDistrict.description -match 'Line') {write-host $IssuesDistrict.description -ForegroundColor Red} else {write-host "Good Service on District Line" -ForegroundColor Green}
        } '8' {
            $IssuesPiccadilly = Invoke-RestMethod -Uri 'https://api.tfl.gov.uk/Line/Piccadilly/Disruption'
            if ($IssuesPiccadilly.description -match 'Line') {write-host $IssuesPiccadilly.description -ForegroundColor Red} else {write-host "Good Service on Picadilly Line" -ForegroundColor Green}
        } '9' {
            $Issueswaterloocity = Invoke-RestMethod -Uri 'https://api.tfl.gov.uk/Line/waterloo-city/Disruption'
            if ($Issueswaterloocity.description -match 'Line') {write-host $Issueswaterloocity.description -ForegroundColor Red} else {write-host "Good Service on Waterloo & City Line" -ForegroundColor Green}
        } '10' {
            $IssuesCircle = Invoke-RestMethod -Uri 'https://api.tfl.gov.uk/Line/Circle/Disruption'
            if ($IssuesCircle.description -match 'Line') {write-host $IssuesCircle.description -ForegroundColor Red} else {write-host "Good Service on Circle Line" -ForegroundColor Green}
        } '11' {
            $IssuesNorthern = Invoke-RestMethod -Uri 'https://api.tfl.gov.uk/Line/Northern/Disruption'
            if ($IssuesNorthern.description -match 'Line') {write-host $IssuesNorthern.description -ForegroundColor Red} else {write-host "Good Service on Northern Line" -ForegroundColor Green}
        } '12' {
            $disruptionsall = Invoke-RestMethod -Uri 'https://api.tfl.gov.uk/Line/Mode/tube/Disruption'
            if ($disruptionsall.description -match 'Line') {write-host $disruptionsall.description -ForegroundColor Red} else {write-host "Good Service on All Lines" -ForegroundColor Green}
        } default {'Q'}
    }
    Pause
}
until ($selection -eq 'q')}