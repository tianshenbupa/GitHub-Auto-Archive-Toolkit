@echo off
setlocal
:: 设置窗口标题
title GitHub Repository Auto-Archive Toolkit

:: 切换到当前脚本所在目录
pushd "%~dp0"

cls
echo ==================================================
echo.
echo    GITHUB REPOSITORY AUTO-ARCHIVE TOOLKIT
echo.
echo    Function: Auto-clone and Zip all Repositories
echo    Location: %~dp0
echo    Engine:   PowerShell Core Engine
echo.
echo ==================================================
echo.
echo [STEP 1] Initializing environment...
echo [STEP 2] Calling PowerShell Backup Logic...
echo.

:: 执行 PowerShell 脚本
powershell -ExecutionPolicy Bypass -File ".\Sync.ps1"

:: 恢复路径
popd
exit