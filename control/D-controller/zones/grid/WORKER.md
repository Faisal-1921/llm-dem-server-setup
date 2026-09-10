# 分区：grid

## 职责

pandapower 基础网、IEEE-33 三相 Units 接入、调度/网络出图（不含 Pyomo 优化模型）。

## 允许路径

1.1.T 可写镜像：`work/server-v1.1t/`。权威快照：`work/server-v1.1-review/`。

- `work/server-v1.1t/lem_dem/grid/`
- `work/server-v1.1-review/lem_dem/plotting.py`
- `work/server-v1.1-review/data/simulation_cases/`
- 只读：`tests/T04_pandapower/`、`tests/T05_ieee33/`

## 入口 / 出口

| 命令 | 出口 |
|---|---|
| `python run.py T04` | `runtime/test-results/T04_pandapower/` |
| `python run.py T05` | `runtime/test-results/T05_ieee33/` |

出图由 T05 测试调用 `generate_plots`，没有独立 `run.py plot`。

## 禁止

- 不要改 `lem_dem/optimization/`（optimization 分区）。
- 不要把 Units 映射逻辑写进电网模块。
