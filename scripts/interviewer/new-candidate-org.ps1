# Creates a pre-loaded scratch org for one interview candidate and prints the login to send them.
param(
    [Parameter(Mandatory = $true)] [string] $Alias,
    [Parameter(Mandatory = $true)] [string] $CandidateEmail,
    [ValidateRange(1, 30)] [int] $Days = 3,
    [string] $DevHub = 'InterviewHub'
)

$ErrorActionPreference = 'Stop'

function Invoke-Sf {
    & sf @args
    if ($LASTEXITCODE -ne 0) { throw "sf $($args -join ' ') failed (exit $LASTEXITCODE)" }
}

Push-Location (Split-Path (Split-Path $PSScriptRoot -Parent) -Parent)
try {
    Invoke-Sf org create scratch -f config/project-scratch-def.json -a $Alias -v $DevHub -y $Days --admin-email $CandidateEmail -w 15
    Invoke-Sf project deploy start -o $Alias
    Invoke-Sf org assign permset -n Load_Assessment -o $Alias
    Invoke-Sf apex run -f scripts/apex/seed-loads.apex -o $Alias
    Invoke-Sf org generate password -o $Alias

    # Never add --verbose here: it prints the org's auth URL, which grants access like a password.
    $org = (& sf org display -o $Alias --json | ConvertFrom-Json).result
    Write-Host ''
    Write-Host 'Send the candidate:'
    Write-Host "  Login URL: $($org.instanceUrl)"
    Write-Host "  Username:  $($org.username)"
    Write-Host "  Password:  $($org.password)"
    Write-Host "  Expires:   $($org.expirationDate)"
    Write-Host ''
    Write-Host "Delete after the interview: sf org delete scratch -o $Alias -p"
}
finally {
    Pop-Location
}
