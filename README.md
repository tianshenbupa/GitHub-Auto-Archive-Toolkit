# 🚀 GitHub Repository Auto-Archive Toolkit (GAT)

A professional automation solution based on **GitHub CLI (gh)** to synchronize and archive all repositories under a user account with one click.

[本项目是一套基于 **GitHub CLI (gh)** 的全自动化备份方案，专门用于一键同步用户账号下的所有仓库。]

---

## 📂 File Description | 文件说明
- **`Run_GitHub_AutoBackup.bat`**: Launcher. Double-click to run (Desktop shortcut recommended). 
  [启动器。双击即可运行（建议创建桌面快捷方式）。]
- **`Sync.ps1`**: Core logic. Handles authentication, cloning, logging, and auto-compression. 
  [核心脚本。负责身份识别、仓库克隆、日志记录及自动压缩。]
- **`All_Backups/`**: Auto-generated folder containing all historical backup archives. 
  [自动生成的文件夹，存放所有历史备份压缩包。]

## 🌟 Key Features | 核心功能
1. **Dynamic Identity**: Automatically detects the current GitHub account, supporting seamless multi-account switching.
   [**动态识别**：自动获取当前登录账号，支持多账号无缝切换。]
2. **Silent Workflow**: Automatically closes after completion; pauses only when errors occur.
   [**一键静默**：运行完成后自动关闭；仅在遇到错误时才停下报错。]
3. **High Efficiency**: Utilizes `--depth 1` (Shallow Clone) to minimize disk usage and download time.
   [**极速备份**：采用 `--depth 1` 浅克隆技术，节省空间与下载时间。]
4. **Archive Management**: Archives are named as `GITHUB_User_Timestamp.zip` for easy identification.
   [**归档管理**：文件名采用 `GITHUB_用户名_时间.zip` 格式，方便检索。]
5. **Detailed Logging**: Includes `Backup_Log.md` inside each ZIP, recording success status and duration.
   [**日志系统**：压缩包内含备份日志，记录执行详情与耗时。]

## 🚀 Usage Guide | 使用指南
1. Ensure `Git` and `GitHub CLI` are installed on your system.
   [确保电脑已安装 `Git` 和 `GitHub CLI`。]
2. Double-click the `.bat` file.
   [双击 `.bat` 文件。]
3. If not logged in, follow the prompts to complete a one-time browser authorization.
   [若未登录，请按提示完成浏览器授权。]
4. Once finished, the window will close automatically in 5 seconds.
   [备份完成后，窗口将在 5 秒后自动消失。]

---
*Created for efficient workflow. v1.1*
