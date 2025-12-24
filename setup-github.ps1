# PowerShell script to initialize Git and push to GitHub
# Run this script in PowerShell with: .\setup-github.ps1

Write-Host "Setting up Git repository and connecting to GitHub..." -ForegroundColor Green

# Initialize git repository
Write-Host "`n1. Initializing Git repository..." -ForegroundColor Yellow
git init

# Add remote repository
Write-Host "`n2. Adding remote repository..." -ForegroundColor Yellow
git remote add origin https://github.com/Sohail7739/aspnetcore-movie-website.git

# Add all files
Write-Host "`n3. Adding all files..." -ForegroundColor Yellow
git add .

# Commit files
Write-Host "`n4. Committing files..." -ForegroundColor Yellow
git commit -m "Initial commit: ASP.NET Core Movie Website upgraded to .NET 8.0"

# Set main branch
Write-Host "`n5. Setting main branch..." -ForegroundColor Yellow
git branch -M main

# Push to GitHub
Write-Host "`n6. Pushing to GitHub..." -ForegroundColor Yellow
Write-Host "You will be prompted for your GitHub credentials." -ForegroundColor Cyan
git push -u origin main

Write-Host "`nDone! Your project has been pushed to GitHub." -ForegroundColor Green
Write-Host "Repository: https://github.com/Sohail7739/aspnetcore-movie-website" -ForegroundColor Cyan

