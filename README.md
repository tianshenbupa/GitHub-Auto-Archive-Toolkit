# 🚀 GitHub Repository Auto-Archive Toolkit (GAT)

<p align="center">
  <a href="#chinese-version"><b>中文说明</b></a> | 
  <a href="#english-version"><b>English Version</b></a>
</p>

---

<a name="chinese-version"></a>
## 🌟 核心功能 (Chinese)

本项目是一套基于 **GitHub CLI (gh)** 的全自动化备份方案，专门用于一键同步用户账号下的所有仓库。

### 📂 文件说明
- **`Run_GitHub_AutoBackup.bat`**: 启动器。双击即可运行（建议创建桌面快捷方式）。
- **`Sync.ps1`**: 核心脚本。负责身份识别、仓库克隆、日志记录及自动压缩。
- **`All_Backups/`**: 自动生成的文件夹，存放所有历史备份压缩包。

### 🛠️ 关键特性
1. **动态识别**：自动获取当前登录的 GitHub 账号，支持多账号无缝切换，无需手动配置。
2. **一键静默**：运行完成后自动 5 秒倒计时关闭；仅在遇到错误时才停下报错，方便调试。
3. **极速备份**：采用 `--depth 1` 浅克隆技术，极大地节省硬盘空间和网络下载时间。
4. **归档管理**：备份文件名采用 `GITHUB_用户名_时间.zip` 格式，方便多账号识别与检索。
5. **日志系统**：压缩包内含 `Backup_Log.md`，记录详细的备份清单及每个仓库的克隆耗时。

### 🚀 使用指南
1. 确保电脑已安装 `Git` 和 `GitHub CLI`。
2. 双击 `.bat` 文件。
3. 若未登录，请按提示在浏览器完成一次性授权。
4. 备份完成后，窗口将自动消失。

---

<a name="english-version"></a>
## 🌟 Key Features (English)

A professional automation solution based on **GitHub CLI (gh)** to synchronize and archive all repositories under a user account with one click.

### 📂 File Description
- **`Run_GitHub_AutoBackup.bat`**: Launcher. Double-click to run (Desktop shortcut recommended). 
- **`Sync.ps1`**: Core logic. Handles authentication, cloning, logging, and auto-compression. 
- **`All_Backups/`**: Auto-generated folder containing all historical backup archives. 

### 🛠️ Key Characteristics
1. **Dynamic Identity**: Automatically detects the current GitHub account, supporting seamless multi-account switching.
2. **Silent Workflow**: Automatically closes with a 5-second countdown; pauses only when errors occur for easy debugging.
3. **High Efficiency**: Utilizes `--depth 1` (Shallow Clone) to minimize disk usage and download time.
4. **Archive Management**: Archives are named as `GITHUB_User_Timestamp.zip` for easy identification.
5. **Detailed Logging**: Includes `Backup_Log.md` inside each ZIP, recording success status and duration for each repo.

### 🚀 Usage Guide
1. Ensure `Git` and `GitHub CLI` are installed on your system.
2. Double-click the `.bat` file.
3. If not logged in, follow the prompts to complete a one-time browser authorization.
4. Once finished, the window will close automatically
