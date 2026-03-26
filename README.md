

````markdown
# 🚀 GitHub 仓库全量自动备份工具 (GAT)

[English](#-english-description) | [中文说明](#-中文说明)

---

<a name="chinese"></a>

## 🇨🇳 中文说明 (Chinese)

本项目是一套基于 **GitHub CLI (gh)** 的全自动化备份方案，专门用于一键同步并归档用户账号下的所有仓库（包括私有仓库）。

### 📂 文件说明
* **`Run_GitHub_AutoBackup.bat`**: 启动器。双击即可运行（建议在桌面创建快捷方式）。
* **`Sync.ps1`**: 核心逻辑。负责身份识别、自动安装检测、仓库克隆、日志记录及自动压缩。
* **`All_Backups/`**: 自动生成的文件夹，按时间戳存放所有的历史备份压缩包。

### 🌟 核心功能
* **动态识别**：自动获取当前登录的 GitHub 账号，支持多账号切换，无需手动硬编码。
* **一键静默**：运行完成后自动倒计时关闭；仅在遇到环境缺失或错误时才停下报错。
* **极速备份**：采用 `--depth 1` 浅克隆技术，极大地节省硬盘空间和网络下载时间。
* **智能归档**：文件名采用 `GITHUB_用户名_日期_时间.zip` 格式，方便多账号检索。
* **详细日志**：压缩包内含 `Backup_Log.md`，记录备份成功的仓库列表及每个任务的耗时。

### 🚀 使用指南
#### 1. 环境准备 (仅需执行一次)
本工具依赖 **Git** 和 **GitHub CLI**。你可以使用下面的“硬核”指令快速配置：

**快速配置环境 (请以管理员权限运行 PowerShell):**
```powershell
winget install --id Git.Git -e; winget install --id GitHub.cli -e
````

💡 **注意**: 安装完成后，请重启终端并运行 `gh auth login` 完成身份验证。

-----

\<a name="english"\>\</a\>

## 🇺🇸 English Description

A lightweight automation toolkit based on **GitHub CLI (gh)** designed to clone and archive all repositories (including private ones) from your account with a single click.

### 📂 File Structure

  * **`Run_GitHub_AutoBackup.bat`**: Launcher. Double-click to run (Shortcut recommended).
  * **`Sync.ps1`**: Core engine. Handles auth, dependency checks, cloning, and archiving.
  * **`All_Backups/`**: Auto-generated directory for all timestamped ZIP archives.

### 🌟 Key Features

  * **Dynamic ID**: Automatically detects the current authenticated GitHub user.
  * **Silent Execution**: Auto-closes after success; stays open only if errors occur.
  * **High Speed**: Utilizes `--depth 1` shallow clone to save disk space and time.
  * **Smart Archiving**: Files named as `GITHUB_User_Date_Time.zip` for easy indexing.
  * **Detailed Logs**: Includes `Backup_Log.md` inside each ZIP with success status and timing.

### 🚀 Quick Start

#### 1\. Environment Setup (One-time)

This tool requires **Git** and **GitHub CLI**. Run the following in **PowerShell (Admin)** for a "hardcore" one-line setup:

**One-line Setup:**

```powershell
winget install --id Git.Git -e; winget install --id GitHub.cli -e
```

💡 **Note**: After installation, restart your terminal and run `gh auth login` to authenticate.

```

