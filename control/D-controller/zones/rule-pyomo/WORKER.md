# 分区：rule-pyomo

## 职责

运行规则文本 → Prompt-Agent 符号 → 静态 Pyomo 构件（`RuleApplication`）。**禁止执行模型生成的 Python 代码。**

## 允许路径

1.1.T 可写镜像：`work/server-v1.1t/`。权威快照：`work/server-v1.1-review/`。

- `work/server-v1.1t/lem_dem/rule_agent.py`
- `work/server-v1.1-review/lem_dem/models/operation_rule.py`
- `work/server-v1.1-review/lem_dem/optimization/rule_modules.py`
- `work/server-v1.1-review/data/prompts/`（规则 Agent 系统提示）
- 只读：`tests/T11_rule_driven_pyomo/`、`tests/T13_rule_pyomo_components/`

实验编排文件（`experiments/rule_driven_pyomo.py` 等）默认只读；要改编排请让高级 Agent 另派 **experiments**。

## 入口 / 出口

| 命令 | 出口 |
|---|---|
| `python run.py T11` | `runtime/test-results/T11_rule_driven_pyomo/` |
| `python run.py T13` | `runtime/test-results/T13_rule_pyomo_components/` |

## 禁止

- 不要 `exec` / `eval` Agent 返回的代码。
- 新规则必须走静态 builder 注册表，并带失败即停审计。
- 不要改 COPT 许可证或 `.env`。
