# PowerShell script to publish project to GitHub
Write-Host "=== Publishing to GitHub ===" -ForegroundColor Cyan
Write-Host ""

# Find Git
$gitPath = $null
$searchPaths = @(
    "C:\Program Files\Git\bin\git.exe",
    "C:\Program Files (x86)\Git\bin\git.exe",
    "C:\Program Files\Microsoft Visual Studio\2022\*\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer\Git\cmd\git.exe"
)

foreach ($path in $searchPaths) {
    $found = Get-ChildItem -Path $path -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($found) {
        $gitPath = $found.FullName
        Write-Host "Found Git at: $gitPath" -ForegroundColor Green
        $env:PATH = "$($found.DirectoryName);$env:PATH"
        break
    }
}

if (-not $gitPath) {
    Write-Host "ERROR: Git not found. Please install Git or use Visual Studio's built-in Git." -ForegroundColor Red
    Write-Host "Download Git from: https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}

# Check if already initialized
if (Test-Path .git) {
    Write-Host "Git repository already initialized." -ForegroundColor Green
} else {
    Write-Host "1. Initializing Git repository..." -ForegroundColor Yellow
    git init
    if ($LASTEXITCODE -ne 0) {
        Write-Host "ERROR: Failed to initialize Git repository" -ForegroundColor Red
        exit 1
    }
}

# Add remote
Write-Host "2. Adding remote repository..." -ForegroundColor Yellow
git remote remove origin 2>$null
git remote add origin https://github.com/Sohail7739/aspnetcore-movie-website.git
if ($LASTEXITCODE -ne 0) {
    Write-Host "WARNING: Remote might already exist, continuing..." -ForegroundColor Yellow
}

# Add files
Write-Host "3. Adding all files..." -ForegroundColor Yellow
git add .
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: Failed to add files" -ForegroundColor Red
    exit 1
}

# Commit
Write-Host "4. Committing files..." -ForegroundColor Yellow
git -c user.name="Sohail7739" -c user.email="user@example.com" commit -m "Initial commit: ASP.NET Core Movie Website upgraded to .NET 8.0"
if ($LASTEXITCODE -ne 0) {
    Write-Host "WARNING: Commit might have failed or nothing to commit" -ForegroundColor Yellow
}

# Set branch
Write-Host "5. Setting main branch..." -ForegroundColor Yellow
git branch -M main 2>$null

# Show status
Write-Host ""
Write-Host "=== Repository Status ===" -ForegroundColor Cyan
git status
Write-Host ""
git remote -v
Write-Host ""

# Push
Write-Host "6. Pushing to GitHub..." -ForegroundColor Yellow
Write-Host "You will be prompted for GitHub credentials." -ForegroundColor Cyan
Write-Host "Username: Your GitHub username" -ForegroundColor Cyan
Write-Host "Password: Use a Personal Access Token (not your password)" -ForegroundColor Cyan
Write-Host "Create token at: https://github.com/settings/tokens" -ForegroundColor Cyan
Write-Host ""

git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "=== SUCCESS! ===" -ForegroundColor Green
    Write-Host "Your project has been published to:" -ForegroundColor Green
    Write-Host "https://github.com/Sohail7739/aspnetcore-movie-website" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "=== Push requires authentication ===" -ForegroundColor Yellow
    Write-Host "Please run this command manually:" -ForegroundColor Yellow
    Write-Host "git push -u origin main" -ForegroundColor White
    Write-Host ""
    Write-Host "Or use Visual Studio:" -ForegroundColor Yellow
    Write-Host "1. Open Team Explorer" -ForegroundColor White
    Write-Host "2. Click 'Sync'" -ForegroundColor White
    Write-Host "3. Click 'Push' to GitHub" -ForegroundColor White
}

