# GitHub Setup Instructions

This guide will help you push this project to the GitHub repository: https://github.com/Sohail7739/aspnetcore-movie-website

## Prerequisites

1. **Install Git** (if not already installed):
   - Download from: https://git-scm.com/download/win
   - Or install via Visual Studio (includes Git)

2. **GitHub Account**: Make sure you're logged into GitHub

## Method 1: Using PowerShell Script (Recommended)

1. Open PowerShell in the project directory
2. Run the script:
   ```powershell
   .\setup-github.ps1
   ```
3. Enter your GitHub credentials when prompted

## Method 2: Using Batch File

1. Double-click `setup-github.bat`
2. Enter your GitHub credentials when prompted

## Method 3: Manual Git Commands

If the scripts don't work, run these commands manually in Git Bash or Command Prompt:

```bash
# Initialize Git repository
git init

# Add remote repository
git remote add origin https://github.com/Sohail7739/aspnetcore-movie-website.git

# Add all files
git add .

# Commit files
git commit -m "Initial commit: ASP.NET Core Movie Website upgraded to .NET 8.0"

# Set main branch
git branch -M main

# Push to GitHub
git push -u origin main
```

## Method 4: Using Visual Studio

1. Open the solution in Visual Studio
2. Go to **View** → **Team Explorer**
3. Click **Manage Connections** → **Sync**
4. Click **Publish to GitHub**
5. Enter repository name: `aspnetcore-movie-website`
6. Select the account: `Sohail7739`
7. Click **Publish**

## Authentication

If you're prompted for credentials:
- **Username**: Your GitHub username
- **Password**: Use a Personal Access Token (not your GitHub password)
  - Create one at: https://github.com/settings/tokens
  - Select scopes: `repo` (full control of private repositories)

## Troubleshooting

- If Git is not recognized, add it to your PATH or use Git Bash
- If you get authentication errors, use a Personal Access Token instead of password
- If the remote already exists, remove it first: `git remote remove origin`

## After Setup

Once pushed, your repository will be available at:
https://github.com/Sohail7739/aspnetcore-movie-website

