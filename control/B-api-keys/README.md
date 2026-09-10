# B. API 密钥登记

本目录**只登记变量名、位置和用途**。禁止把真实密钥写入本文件夹、提交到 Git、打印到对话或日志。

本机仓库没有 `.env`。真实文件只在服务器上，权限应为 `600`，且被 Git 忽略。

模板副本：[env.example](env.example)

## DeepSeek

| 变量 | 用途 | 默认 |
|---|---|---|
| `DEEPSEEK_API_KEY` | 调用凭据 | 无；占位符 `your_deepseek_api_key_here` 视为未配置 |
| `DEEPSEEK_BASE_URL` | API 根 | `https://api.deepseek.com` |
| `DEEPSEEK_MODEL` | 模型名 | `deepseek-v4-flash` |

### 文件位置（可能不止一份）

| 路径 | 谁读 |
|---|---|
| `/home/zhouyx/workspace/LEM-DEM-V1.1.20260904.REFACTOR/.env` | V1.1 `mapping.py` 的 `load_dotenv(PROJECT_DIR / ".env")` — **计算用这份** |
| `/home/zhouyx/workspace/LEM-DEM-V0.3.20260907-RuleAgent/.env` | V0.3 `mapping.py` 的 `load_dotenv(PROJECT_DIR / ".env")` — RuleAgent 脚手架 API 测试用这份。变量名与模板同 [env.example](env.example) |
| `/home/zhouyx/workspace/.env` | `lem_dem_web.py` 只检查 `DEEPSEEK_API_KEY` 是否存在，输出布尔 `api_key_configured`。**可能与项目 .env 不是同一文件** |
| `/home/zhouyx/workspace/LEM-DEM-Design-Platform/.env` | 旧 V0.1 / `lem-dem` 包装脚本，不是最新入口 |

本机模板：`work/LEM-DEM-Design-Platform/.env.example`、`work/LEM-DEM-Design-Platform-copt-interface/.env.example`。

允许的检查方式：看文件是否存在、权限是否 `600`、值是否仍是 `your_` 前缀。不要 `cat` 或 `echo` 密钥。

## 测试开关（不是密钥）

| 变量 | 作用 |
|---|---|
| `RUN_DEEPSEEK_REAL_API_TESTS` | `python run.py test --real-api` 时由 CLI 设置 |
| `RUN_T13_REAL_API_TESTS` | 同上 |
| `RUN_T14_REAL_API_TESTS` | 同上 |
| `RUN_T12_RESULT_AUDIT` / `RUN_T14_RESULT_AUDIT` | 产物审计测试 |

## 非 API 凭据（只记路径）

| 类别 | 位置 | 规则 |
|---|---|---|
| COPT 许可证目录 | `COPT_LICENSE_DIR=/home/zhouyx/copt` | 不要读取 `license.key` 正文 |
| SSH Linux | `/Users/mike/.ssh/id_rsa` | 只使用，不打印 |
| SSH Windows | `/Users/mike/.ssh/id_ed25519` | 只使用，不打印 |
| RustDesk | 无文件登记 | 用户在 GUI 输入，禁止写入脚本 |
| GitHub | 无文件登记；账号 `Faisal-1921` | Token 只留在已登录的 Mac `gh`/凭据管理器。禁止写入本目录、禁止复制到 Linux 或公共仓。代码仓与公共仓见 [../A-server-interfaces/github.md](../A-server-interfaces/github.md) |

## Agent 禁令

- 不要把真实 `.env` 拷进 `control/`。
- 不要在 TASK / STATUS / REPORT 里粘贴密钥或私钥。
- Web 预览若指向 `.env`，应得到 403；不要改代码去放开。
