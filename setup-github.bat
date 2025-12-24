@echo off
echo Setting up Git repository and connecting to GitHub...
echo.

echo 1. Initializing Git repository...
git init

echo.
echo 2. Adding remote repository...
git remote add origin https://github.com/Sohail7739/aspnetcore-movie-website.git

echo.
echo 3. Adding all files...
git add .

echo.
echo 4. Committing files...
git commit -m "Initial commit: ASP.NET Core Movie Website upgraded to .NET 8.0"

echo.
echo 5. Setting main branch...
git branch -M main

echo.
echo 6. Pushing to GitHub...
echo You will be prompted for your GitHub credentials.
git push -u origin main

echo.
echo Done! Your project has been pushed to GitHub.
echo Repository: https://github.com/Sohail7739/aspnetcore-movie-website
pause

