# 🚀 GitHub Auto Backup Toolkit (GAT)

> 一键备份你所有 GitHub 仓库（含私有仓库）的自动化工具

[English](#-english) | [中文说明](#-中文说明)

---

<a name="中文说明"></a>

## 🇨🇳 中文说明

**GitHub Auto Backup Toolkit (GAT)** 是一个基于 **GitHub CLI (`gh`)** 的轻量级自动化工具，用于将你账号下的所有仓库进行**一键克隆 + 压缩归档**，支持私有仓库，适合长期数据备份与迁移。

---

## ✨ 核心亮点

- 🔍 **自动识别账号**  
  无需配置用户名，自动读取当前 `gh` 登录账户，支持多账号切换

- ⚡ **一键无感执行**  
  正常执行自动退出，仅在异常时停留提示

- 🚀 **高速浅克隆**  
  使用 `--depth 1`，显著减少下载时间与存储占用

- 📦 **结构化归档**  
  自动生成：  
  `GITHUB_用户名_YYYY-MM-DD_HH-mm.zip`

- 📝 **完整日志记录**  
  每次备份附带 `Backup_Log.md`

---

## 📁 项目结构

```
.
├── Run_GitHub_AutoBackup.bat
├── Sync.ps1
└── All_Backups/
```

---

## 🚀 快速开始

### 1️⃣ 环境准备（仅需一次）

```powershell
winget install --id Git.Git -e; winget install --id GitHub.cli -e
```

### 2️⃣ 登录

```bash
gh auth login
```

### 3️⃣ 运行

双击：

```
Run_GitHub_AutoBackup.bat
```

---

<a name="english"></a>

## 🇺🇸 English

**GitHub Auto Backup Toolkit (GAT)** is a lightweight automation tool powered by **GitHub CLI (`gh`)**, designed to clone and archive all repositories (including private ones).

---

## ✨ Key Features

- Auto account detection  
- Silent execution  
- Fast shallow clone  
- Structured archive  
- Logs included  

---

## 🚀 Quick Start

```powershell
winget install --id Git.Git -e; winget install --id GitHub.cli -e
```

```bash
gh auth login
```

Run:

```
Run_GitHub_AutoBackup.bat
```
