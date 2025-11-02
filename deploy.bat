@echo off
chcp 65001 >nul
echo ========================================
echo   GitHub Pages 自动部署脚本
echo ========================================
echo.

echo 步骤1: 检查Git状态
git status

echo.
echo 步骤2: 添加文件到暂存区
git add .

echo.
set /p commit_msg="请输入提交信息（默认：Auto deploy to GitHub Pages）: "
if "%commit_msg%"=="" set commit_msg=Auto deploy to GitHub Pages

echo 步骤3: 提交更改
git commit -m "%commit_msg%"

echo.
echo 步骤4: 推送到GitHub
git push origin master

echo.
echo 步骤5: 检查GitHub Pages设置
echo 请确保在GitHub仓库设置中：
echo 1. 进入 Settings -> Pages
echo 2. Source 选择 Deploy from a branch
echo 3. Branch 选择 master 或 main，文件夹选择 / (root)
echo.

echo 步骤6: 等待GitHub Pages构建
echo GitHub Pages通常会在几分钟内自动构建
echo 您可以在仓库的 Actions 标签页查看构建状态
echo.

echo ========================================
echo   部署完成！
echo ========================================
echo 您的网站地址：https://TTatonce.github.io/23333
echo 请将 TTatonce 替换为您的用户名
echo 将 23333 替换为您的仓库名
echo.
pause