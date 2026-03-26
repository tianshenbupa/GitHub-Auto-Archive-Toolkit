<#
.SYNOPSIS
    GitHub Repository Auto-Archive Toolkit (GAT)

.DESCRIPTION
    A lightweight automation tool designed to clone all accessible repositories 
    (including private ones) from the current authenticated GitHub user and 
    archive them into a timestamped ZIP file.

.PARAMETER None
    This script identifies the user via GitHub CLI (gh) automatically.

.EXAMPLE
    .\Run_GitHub_AutoBackup.bat

.NOTES
    Version: 1.1
    License: MIT License
    Requires: Git, GitHub CLI (gh)
#>

$ErrorActionPreference = "Stop"
try {
    Write-Host "--- Checking Environment ---" -ForegroundColor Cyan
    if (!(Get-Command git -ErrorAction SilentlyContinue)) { throw "Git not found!" }
    if (!(Get-Command gh -ErrorAction SilentlyContinue)) { throw "GitHub CLI (gh) not found!" }

    # 1. 身份检查与动态账号获取
    Write-Host "Checking GitHub Auth..."
    $authCheck = gh auth status 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Not logged in. Opening browser..." -ForegroundColor Yellow
        gh auth login --hostname github.com --protocols https --web
    }

    # 自动识别当前登录的用户名并更新窗口标题
    $githubUser = gh api user --jq .login
    $Host.UI.RawUI.WindowTitle = "[GitHub Backup] - User: @$githubUser"
    
    $date = Get-Date -Format "yyyyMMdd_HHmm"
    
    # 2. 路径逻辑：归档到 All_Backups 文件夹
    $archiveDirName = "All_Backups" 
    $archivePath = Join-Path $PSScriptRoot $archiveDirName
    if (!(Test-Path $archivePath)) { 
        New-Item -ItemType Directory -Path $archivePath | Out-Null 
    }
    
    # --- 文件名包含用户名 ---
    $zipName = "GITHUB_$($githubUser)_$date.zip"
    $tempDir = Join-Path $PSScriptRoot "gh_temp"
    $zipPath = Join-Path $archivePath $zipName 
    $logFile = Join-Path $tempDir "Backup_Log.md"

    # 3. 准备临时工作目录
    if (Test-Path $tempDir) { Remove-Item -Recurse -Force $tempDir }
    New-Item -ItemType Directory -Path $tempDir | Out-Null

    # 4. 获取仓库列表
    Write-Host "Fetching repo list for @$githubUser..." -ForegroundColor Cyan
    $repos = gh repo list --limit 1000 --source --json name | ConvertFrom-Json
    $totalRepos = $repos.Count
    $successCount = 0
    $failCount = 0

    # 5. 初始化日志内容 (Markdown 格式)
    $logContent = @"
# GitHub Backup Report
- **User:** @$githubUser
- **Date:** $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
- **Total Repos Found:** $totalRepos

## Details
| Repository Name | Status | Time |
| :--- | :--- | :--- |
"@

    # 6. 开始克隆仓库 (Depth 1 极速模式)
    foreach ($repo in $repos) {
        $name = $repo.name
        $startTime = Get-Date
        Write-Host "Cloning: $name ..." -ForegroundColor Green
        
        try {
            gh repo clone $name "$tempDir/$name" -- --depth 1 --quiet
            $endTime = Get-Date
            $duration = ($endTime - $startTime).TotalSeconds.ToString("F2") + "s"
            # 兼容性修改：使用文本状态标识
            $logContent += "`n| $name | [OK] Success | $duration |"
            $successCount++
        } catch {
            $logContent += "`n| $name | [!!] Failed | - |"
            $failCount++
        }
    }

    # 7. 统计总结并写入日志
    $logContent += "`n`n## Summary`n- **Successfully Backed Up:** $successCount`n- **Failed:** $failCount"
    
    # 关键修复：使用 .NET 方法强制以无 BOM 的 UTF8 编码写入文件
    $Utf8NoBom = New-Object System.Text.UTF8Encoding $False
    [System.IO.File]::WriteAllText($logFile, $logContent, $Utf8NoBom)

    # 8. 创建压缩包并清理
    if (Test-Path $zipPath) { Remove-Item $zipPath }
    Write-Host "`nCreating Zip: $zipName ..." -ForegroundColor Yellow
    Compress-Archive -Path "$tempDir\*" -DestinationPath $zipPath
    Remove-Item -Recurse -Force $tempDir

    # --- 成功退出逻辑 ---
    Write-Host "`n==================================================" -ForegroundColor Cyan
    Write-Host "    BACKUP SUCCESSFUL! " -ForegroundColor Green
    Write-Host "    User: @$githubUser"
    Write-Host "    Archive: $archiveDirName\$zipName"
    Write-Host "    This window will close automatically in 5 seconds."
    Write-Host "==================================================" -ForegroundColor Cyan
    
    Start-Sleep -Seconds 5

} catch {
    # --- 报错停留逻辑 ---
    Write-Host "`n[!] ERROR OCCURRED:" -ForegroundColor Red
    Write-Host "$($_.Exception.Message)" -ForegroundColor White -BackgroundColor Red
    Write-Host "`nPlease check your network or GitHub auth status."
    Write-Host "`nPress any key to close this window..."
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null
}