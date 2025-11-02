@echo off
chcp 65001 >nul
echo ========================================
echo   Auto Deploy Script
echo ========================================
echo.

echo Checking Git status...
git status

echo.
echo Adding files to staging area...
git add .

set /p commit_msg="Enter commit message: "
if "%commit_msg%"=="" (
    set commit_msg=Auto deployment
)

echo Committing changes...
git commit -m "%commit_msg%"

echo Pushing to remote repository...
REM 自动检测当前分支
for /f "tokens=*" %%i in ('git branch --show-current') do set current_branch=%%i
echo Current branch: %current_branch%
git push origin %current_branch%

echo.
echo ========================================
echo   Deployment Completed!
echo ========================================
echo.
pause