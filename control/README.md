# LEM-DEM 中心控制平面

本目录是 Cursor **高级 Agent** 的入口。先读本文件，再按任务打开 A / B / C，最后用 D 把工作拆给分区干活 Agent。

这不是业务代码仓库。权威运行代码在 Linux 服务器；本机是控制、同步与结果归档。

## 固定术语

| 用户说法 | 含义 |
|---|---|
| 服务器 / 在服务器运行 | Linux 实验室 `lab-linux`（`eilab-8315`，`111.204.214.66`） |
| 连接 / 连接远程桌面 / 断开 | Windows 主机 `win-desktop`（`100.110.230.14`）+ RustDesk |
| 最新版本 / 当前程序 | **LEM-DEM V1.1**，不是 Design-Platform V0.1/V0.2 |

不得把 Windows 与 Linux 混为一谈。计算只在 Linux 上跑。

## 权威路径

| 角色 | 路径 |
|---|---|
| 服务器最新项目 | `/home/zhouyx/workspace/LEM-DEM-V1.1.20260904.REFACTOR` |
| 本机代码快照 | `work/server-v1.1-review/` |
| 本机工作区 | `/Users/mike/Documents/Monitor_Server` |
| 本机结果镜像 | `outputs/` |
| Conda | `/home/zhouyx/miniforge3`，环境名 `project`，Python 3.12 |
| 用户命令 | `/home/zhouyx/bin/lem-dem-web`（监控，8765）；V1.1 用 `python run.py`；`python run.py control-ui`（调用关系，8767，当前扫 **1.1.T**）；V0.3 图谱页用 `python run.py graph-web`（8766） |

## GitHub 仓库（2026-09-10 用户确认）

| 角色 | 仓库 | 可见性 |
|---|---|---|
| 代码仓 | [`Faisal-1921/LEM-DEM-Design-Platform`](https://github.com/Faisal-1921/LEM-DEM-Design-Platform) | private |
| 跨机器公共仓 | [`Faisal-1921/llm-dem-server-setup`](https://github.com/Faisal-1921/llm-dem-server-setup) | public（本 `control/` 发布于此） |

细节：[A-server-interfaces/github.md](A-server-interfaces/github.md)。Windows 从公共仓拉 control：[A-server-interfaces/windows-bootstrap.md](A-server-interfaces/windows-bootstrap.md)。V1.1 权威代码仍在 Linux，不在这两个 GitHub 仓。

## 跨机器共享材料（请其他 Agent 拉取）

2026-09-10 已把汇报 PPT 推进本公共仓。Mac / Linux / 其他 Windows 上的 Agent 在公共仓 clone 里执行 `git pull --ff-only`，然后打开：

`shared/briefings/周禹轩-汇报3.pptx`

目录说明：[../shared/README.md](../shared/README.md)。不要去 Windows `E:\Mike_项目材料整理_...` 找源文件。

## 阅读顺序

1. [A-server-interfaces/](A-server-interfaces/README.md) — SSH、GitHub、Windows 引导、只读监控、V0.3 图谱可视化、DeepSeek、COPT
2. [B-api-keys/](B-api-keys/README.md) — 密钥**登记**（无真实值）
3. [C-programs/](C-programs/README.md) — V1.1 各程序入口、出口、功能；历史版本禁入
4. [D-controller/](D-controller/README.md) — 用 Markdown 分发给分区干活 Agent

## 硬规则（所有 Agent）

- 禁止读取、打印、提交、复制真实 `.env`、API Key、SSH 私钥、COPT `license.key`、RustDesk 密码、GitHub Token。
- GitHub：代码仓 private `Faisal-1921/LEM-DEM-Design-Platform`；公共仓 `Faisal-1921/llm-dem-server-setup`。不要把 Token 拷到 Linux。
- 默认只读探查服务器。写操作仅限 `/home/zhouyx`，且须用户明示。
- 不要把监听地址改成 `0.0.0.0`。监控 Web 只绑 `127.0.0.1:8765`；V0.3 知识图谱可视化只绑 `127.0.0.1:8766`；V1.1 `control_UI` 只绑 `127.0.0.1:8767`。三页都不要加执行接口。
- 不要用 `StrictHostKeyChecking=no`。
- 最新入口是 V1.1 的 `python run.py`。`server/public/lem-dem` 与 `C_01_main_controller.py` 是旧入口。
- 分发协议见 `D-controller/`。一次任务只派一个分区。

Cursor 规则 [`.cursor/rules/control-plane.mdc`](../.cursor/rules/control-plane.mdc) 会始终套用上述要点。

## 本机 SSH 配置

```bash
ssh -F /Users/mike/Documents/Monitor_Server/configs/ssh_config_linux lab-linux
```
