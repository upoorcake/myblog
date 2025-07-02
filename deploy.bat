@echo off
echo 正在生成网站...
hexo g
if %errorlevel% neq 0 (
    echo 生成失败，尝试清理缓存...
    hexo clean && hexo g
)

echo 正在提交更改...
git add .
set /p commit_msg=请输入提交信息（直接回车使用默认）:
if "%commit_msg%"=="" set commit_msg=更新博客内容

git commit -m "%commit_msg%"
git push origin master

echo 部署完成！
pause
