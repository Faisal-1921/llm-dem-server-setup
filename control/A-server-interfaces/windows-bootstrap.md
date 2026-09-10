# Windows 本机配置（从公共仓拉取 control）

本文件给**已经运行在 Windows 上**的 Agent。这台机器就是术语里的 `win-desktop`（「连接」目标），**不是**计算服务器。计算只在 Linux `lab-linux`。

完整入口仍是 [../README.md](../README.md)。GitHub 约定见 [github.md](github.md)。

## 这台机器

| 项 | 值 |
|---|---|
| 角色 | `win-desktop`（远程桌面端点，非计算入口） |
| 用户 | `mike_` |
| Tailscale IPv4 | `100.110.230.14` |
| SSH | 对本机 `:22` 提供 OpenSSH，供 Mac 公钥登录 |
| 公共仓落盘（建议） | `%USERPROFILE%\Documents\LEM-DEM-public` |
| 历史 Windows Python（V0.1，过时） | `C:\Users\mike_\anaconda3\envs\deepseek_units\python.exe` |

## 1. 拉取公共仓

若工作区里还没有 `control/README.md`，先 clone（无需 GitHub 登录）：

```powershell
$dest = Join-Path $env:USERPROFILE "Documents\LEM-DEM-public"
if (-not (Test-Path (Join-Path $dest "control\README.md"))) {
  git clone https://github.com/Faisal-1921/llm-dem-server-setup.git $dest
}
cd $dest
git pull --ff-only
```

然后打开该目录，先读 `control\README.md`，再读本文件与 `control\A-server-interfaces\github.md`。

不要 clone 私有代码仓 `LEM-DEM-Design-Platform`，除非用户已登录 GitHub 并明示。未登录会 404。

## 2. 本机应核对的状态（默认只读探查）

在 PowerShell 中检查，**不要**把私钥、`.env`、RustDesk 密码打印出来：

```powershell
whoami
$env:COMPUTERNAME
# Tailscale（若已安装）
Get-Command tailscale -ErrorAction SilentlyContinue
tailscale ip -4
# OpenSSH 服务与 22 端口
Get-Service sshd -ErrorAction SilentlyContinue | Select-Object Name, Status
Get-NetTCPConnection -LocalPort 22 -State Listen -ErrorAction SilentlyContinue
# Git
git --version
```

预期：Tailscale 地址为 `100.110.230.14`；`sshd` 为 Running；22 在听。若 Tailscale 未连上，打开 Tailscale 应用并让用户在 GUI 登录，不要把账号密码写入命令。

## 3. 允许改 / 禁止改

允许（用户已要求「本机配置」时）：

- 把公共仓 clone 到 `%USERPROFILE%\Documents\LEM-DEM-public`
- 确认 Git、OpenSSH Server、Tailscale 已安装且在跑
- 只登记路径，不写入真实密钥

禁止：

- 关机或重启这台 Windows
- 把 GitHub Token、SSH 私钥、`.env`、COPT 许可证、RustDesk 密码写入磁盘上的脚本或 md
- 把监听改成 `0.0.0.0` 去对外暴露监控页（监控在 Linux `127.0.0.1:8765`）
- 把 `C_01_main_controller.py` 或公共仓根目录的 `CODEX_SERVER_SETUP.sh` 当成 V1.1 入口
- 在 Windows 上当计算节点跑 V1.1；权威入口是 Linux  
  `/home/zhouyx/workspace/LEM-DEM-V1.1.20260904.REFACTOR` 的 `python run.py`
- 修改系统目录、或把私有代码仓内容推进公共仓

## 4. 配完后向用户汇报

1. 公共仓路径与 `git rev-parse --short HEAD`
2. Tailscale IPv4 是否为 `100.110.230.14`
3. `sshd` 与端口 22 是否在听
4. 未读取、未提交任何密钥
