# 分区：mapping

## 职责

文本 → Units 六元组、术语表、Pydantic Unit schema、DeepSeek 映射客户端（不含规则符号 Agent）。

## 允许路径

1.1.T 可写镜像：`work/server-v1.1t/`。权威 V1.1 快照：`work/server-v1.1-review/`（默认只读）。

- `work/server-v1.1t/lem_dem/mapping.py`
- `work/server-v1.1-review/lem_dem/terminology.py`
- `work/server-v1.1-review/lem_dem/models/unit.py`
- `work/server-v1.1-review/data/examples/`
- `work/server-v1.1-review/data/prompts/unit_six_tuple_system_prompt.txt`
- `work/server-v1.1-review/data/terminology/`
- 对应测试仅当 TASK 同时授权 `tests` 分区时才改；否则只读 `tests/T01_api_mapping/`、`tests/T02_schema/`、`tests/T03_terminology/`

服务器可写 1.1.T：`/home/zhouyx/workspace/LEM-DEM-V1.1.T.20260904.REFACTOR-TEST/`。权威只读：`/home/zhouyx/workspace/LEM-DEM-V1.1.20260904.REFACTOR/`。

## 入口 / 出口

- 入口：`python run.py T01`（schema `T02`，术语 `T03`）
- 出口：`runtime/test-results/T01_api_mapping/` 等
- 隐藏旧命令：`python run.py --legacy map`

## 禁止

- 不要改 `rule_agent.py` 或 `optimization/rule_modules.py`（那是 rule-pyomo）。
- 不要打印 `DEEPSEEK_API_KEY`。
- 不要把 V0.1 的 `A_01_deepseek_mapping_method.py` 当最新实现。
