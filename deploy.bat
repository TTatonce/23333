@echo off
echo ========================================
echo   星穹六象标签系统 - 自动部署脚本
echo ========================================
echo.

REM 检查是否有未提交的更改
git status --porcelain
if %errorlevel% equ 0 (
    echo 检查到未提交的更改...
) else (
    echo 工作区是干净的
)

REM 添加所有更改
echo 正在添加文件到暂存区...
git add .

REM 提交更改
set /p commit_msg="请输入提交信息（默认：自动部署更新）: "
if "%commit_msg%"=="" set commit_msg=自动部署更新
git commit -m "%commit_msg%"

REM 推送到远程仓库
echo 正在推送到远程仓库...
git push origin main

REM 如果使用GitHub Pages，可以添加构建步骤
echo 正在构建项目...
REM 这里可以添加构建命令，比如 npm run build 等

echo.
echo ========================================
echo   部署完成！
echo ========================================
echo.
pause