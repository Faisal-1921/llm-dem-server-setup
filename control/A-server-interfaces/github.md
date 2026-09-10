# GitHub 仓库约定

用户 2026-09-10 确认：代码仓与跨机器公共仓就是下面两个。不要另找、不要新建，除非用户明示。

GitHub 用户：[`Faisal-1921`](https://github.com/Faisal-1921)（用户 ID `55022803`）。

## 两个仓库

| 角色 | 仓库 | 可见性 | clone |
|---|---|---|---|
| **代码仓** | [`Faisal-1921/LEM-DEM-Design-Platform`](https://github.com/Faisal-1921/LEM-DEM-Design-Platform) | **private** | `https://github.com/Faisal-1921/LEM-DEM-Design-Platform.git` |
| **跨机器公共仓** | [`Faisal-1921/llm-dem-server-setup`](https://github.com/Faisal-1921/llm-dem-server-setup) | **public** | `https://github.com/Faisal-1921/llm-dem-server-setup.git` |

未登录访问私有代码仓会得到 404，这是正常的。

### 代码仓（private）

- 研究代码的 Git 源。默认分支 `main`。
- 本机 Mac 已有 clone：`work/LEM-DEM-Design-Platform/`。
- 该仓当前对应 **V0.1**（`C_01_main_controller.py`），**不是**最新入口。
- 最新权威代码在 Linux：`/home/zhouyx/workspace/LEM-DEM-V1.1.20260904.REFACTOR`（`python run.py`）。V1.1 **尚未**作为独立 GitHub 仓发布。
- 服务器没有 GitHub 凭据。更新私有仓：在已登录 GitHub 的 Mac 上拉取，再 SSH/SCP 到 Linux。**不要**把 GitHub Token 复制到服务器或写入本目录。

### 跨机器公共仓（public）

- Mac / Windows / Linux 均可**不登录** clone。
- 用途：分发 `control/` 控制平面，以及旧版 Linux Python 3.11 安装脚本（`CODEX_SERVER_SETUP.sh`、`D_01_requirements.txt`）。
- **不是**业务代码本体，也**不是** V1.1 运行入口。
- 默认可 clone：

```bash
git clone https://github.com/Faisal-1921/llm-dem-server-setup.git
```

Windows（PowerShell）：

```powershell
git clone https://github.com/Faisal-1921/llm-dem-server-setup.git "$env:USERPROFILE\Documents\LEM-DEM-public"
```

Agent 先读 clone 后的 `control/README.md`。Windows 本机配置见 [windows-bootstrap.md](windows-bootstrap.md)。

## 同账号其它公开仓（不纳入本研究）

`Optimal-Sizing-Small-Scale-MG`、`Basopra`、`PV_BESS_model`、`BLAST-Lite`（均为 fork）、空仓 `Faisal`。不要当 LEM-DEM 代码源。

## 禁止

- 不要把真实 `.env`、API Key、SSH 私钥、COPT `license.key`、RustDesk 密码、GitHub Token 推进任一仓库。
- 不要把 `control/B-api-keys/` 的占位模板改成真值后再提交。
- 不要用 `gh api` 代替未认证公开查询；本机 `gh` 若 token 失效，用 `curl https://api.github.com/users/Faisal-1921/repos`。
- 不要把岩土边坡 LEM–DEM 论文仓库当成本研究。
