# LLM-DEM 跨机器公共仓

本仓库是 **public** 分发点：Mac / Windows / Linux 均可不登录 clone。

- **`control/`**：LEM-DEM 中心控制平面。Agent **先读** [`control/README.md`](control/README.md)。
- **`shared/`**：跨机器材料。其他 Agent 请 `git pull --ff-only` 后取 [`shared/briefings/周禹轩-汇报3.pptx`](shared/briefings/周禹轩-汇报3.pptx)（2026-09-10 上传）。见 [`shared/README.md`](shared/README.md)。
- `CODEX_SERVER_SETUP.sh`、`D_01_requirements.txt`：旧版 V0.1 的 Linux Python 3.11 venv 脚本，**不是**当前入口。

| 角色 | 仓库 |
|---|---|
| 本仓（跨机器公共） | `Faisal-1921/llm-dem-server-setup` |
| 代码仓（private） | `Faisal-1921/LEM-DEM-Design-Platform` |

权威运行代码在 Linux：`/home/zhouyx/workspace/LEM-DEM-V1.1.20260904.REFACTOR`，入口 `python run.py`。不要把 GitHub Token、`.env`、SSH 私钥推进本仓。

Windows 本机配置：[`control/A-server-interfaces/windows-bootstrap.md`](control/A-server-interfaces/windows-bootstrap.md)。
