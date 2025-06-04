@echo off
REM 参数1是文件路径，参数2是行号
set FILE=%1
set LINE=%2
REM 启动 Neovide 并跳转到指定文件和行
start "" "C:\Program Files\Neovide\neovide.exe" "%FILE%" +%LINE%
