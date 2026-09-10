# 分区：experiments

## 职责

长时编排：动态 Units、DeepSeek-Pyomo 批量、T12/T13/T14 轮次循环、本机 `outputs/` 解读与实验报告。

## 允许路径

1.1.T 可写镜像：`work/server-v1.1t/`。权威快照：`work/server-v1.1-review/`。

- `work/server-v1.1t/lem_dem/experiments/`
- `work/server-v1.1-review/lem_dem/full_process.py`
- `work/server-v1.1-review/lem_dem/full_process_cli.py`
- `work/server-v1.1-review/lem_dem/experiments/batch.py` 等
- `outputs/`（默认只读；仅当 TASK 要求撰写报告时新增 md）
- 只读：`tests/T06`–`T09`、`T12`、`T14`

核心模型（`mapping.py`、`rule_modules.py`、`optimization/model.py`）默认只读。要改实现请高级 Agent 改派对应分区。

## 入口 / 出口

| 命令 | 默认出口 |
|---|---|
| `python run.py T09` | `runtime/test-results/T09_full_process/` |
| `python run.py T01`（批量映射） | `runtime/test-results/T01_api_mapping/` |
| `python run.py T06` | `runtime/test-results/T06_prompt_effect/` |
| `python run.py T07` | `runtime/test-results/T07_consistency/` |
| `python run.py T12` | `runtime/test-results/T12_dynamic_rules/` |
| `python run.py T14` | `runtime/test-results/T14_dynamic_rule_components/` |
| `python run.py T15` | `runtime/test-results/T15_annual_rule_simulation/` |
| `python run.py T16` | `runtime/test-results/T16_bilevel_annual_simulation/` |

本机 T14 历史镜像：`outputs/LEM-DEM-T14-REAL-100-ROUND-20260907/`。用户入口是 `run.py Txx`，不是实验名。

## 禁止

- 不要在无用户授权时对服务器发起百轮真实 API 实验（费钱、占 COPT）。
- 不要把 `outputs/` 里的 JSON 当源码去「修复」。
