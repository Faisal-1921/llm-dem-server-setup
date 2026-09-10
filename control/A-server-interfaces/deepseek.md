# DeepSeek 出站接口

仓库内没有自建「映射 REST 服务」。LEM-DEM 用 OpenAI SDK 作为 **HTTP 客户端** 调用 DeepSeek。

| 项 | 值 |
|---|---|
| SDK | `openai.OpenAI` |
| 默认 `base_url` | `https://api.deepseek.com` |
| 默认模型 | `deepseek-v4-flash` |
| 密钥变量 | `DEEPSEEK_API_KEY`（见 B，禁止打印值） |
| 典型调用 | `client.chat.completions.create`，`json_object`，`temperature=0` |

## 加载位置

各项目在**自己的项目根** `.env` 上 `load_dotenv`：

- 服务器 V1.1：`/home/zhouyx/workspace/LEM-DEM-V1.1.20260904.REFACTOR/.env`
- 服务器 V0.3：`/home/zhouyx/workspace/LEM-DEM-V0.3.20260907-RuleAgent/.env`
- 本机 V1.1 快照对应代码：`work/server-v1.1-review/lem_dem/mapping.py`

创建客户端：

```text
OpenAI(api_key=DEEPSEEK_API_KEY, base_url=DEEPSEEK_BASE_URL)
```

占位符 `your_deepseek_api_key_here` 视为未配置，直接失败。

## 调用方（V1.1）

| 模块 | 作用 |
|---|---|
| `lem_dem/mapping.py` | 自由文本 → Units 六元组 JSON |
| `lem_dem/rule_agent.py` | 运行规则文本 → 校验过的规则符号 |
| `lem_dem/evaluation/prompt_quality.py` | 提示词效果评估（生成 + 规则化） |
| `lem_dem/full_process.py` | 全流程中的映射步骤 |

Agent 生成的代码**不会**被执行。规则路径里 DeepSeek 只产出符号；静态 Python 注册表再映射到 Pyomo 构件。

## 入口命令

```bash
cd /home/zhouyx/workspace/LEM-DEM-V1.1.T.20260904.REFACTOR-TEST
python run.py T01
python run.py T11 --real-api
```

V0.3 脚手架只测连通性（非六元组映射）：

```bash
cd /home/zhouyx/workspace/LEM-DEM-V0.3.20260907-RuleAgent
python run.py test-api
```
