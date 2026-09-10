# 分发协议

## 状态机

```text
queued  → running → done
              ↘ blocked → running 或 cancelled
```

| 状态 | 文件位置 | 谁写 |
|---|---|---|
| queued | `inbox/TASK-<id>.md` | 高级 Agent |
| running | `active/TASK-<id>.md` + `active/STATUS-<id>.md` | 干活 Agent 启动时移动并建 STATUS |
| blocked | 更新 STATUS，任务文件留在 `active/` | 干活 Agent |
| done | `outbox/REPORT-<id>.md`；TASK 可留在 `outbox/` 或删除 inbox/active 副本 | 干活 Agent |
| cancelled | STATUS 标明原因；不要假装完成 | 高级 Agent 或干活 Agent |

`<id>` 用短横线英文或拼音，例如 `t14-readout`。同一任务的 TASK / STATUS / REPORT 共用该 id。

## TASK 必填字段

见 `examples/TASK.example.md`：目标、分区、允许路径、禁止事项、完成标准、只读还是可写、是否允许 SSH。

## STATUS 必填字段

见 `examples/STATUS.example.md`：状态、当前步骤、阻塞原因、已改文件。

## REPORT 必填字段

见 `examples/REPORT.example.md`：结论、证据路径、未做事项、是否越权（应否）。

## 分区对照

| 分区 | 何时派 | WORKER |
|---|---|---|
| mapping | 文本→Units、术语、六元组 schema、DeepSeek 映射客户端 | [zones/mapping/WORKER.md](zones/mapping/WORKER.md) |
| grid | pandapower / IEEE-33 仿真与出图 | [zones/grid/WORKER.md](zones/grid/WORKER.md) |
| optimization | Pyomo 模型、求解器适配、COPT 日志、连续优化 | [zones/optimization/WORKER.md](zones/optimization/WORKER.md) |
| rule-pyomo | 规则 Agent、符号 IR、静态构件注册表、RuleApplication | [zones/rule-pyomo/WORKER.md](zones/rule-pyomo/WORKER.md) |
| experiments | `lem_dem/experiments/`、T12–T14 编排与 `outputs/` 解读 | [zones/experiments/WORKER.md](zones/experiments/WORKER.md) |
| monitor | Web 监控、SSH 隧道、`lem-dem-web`（8765）。V0.3 图谱页 8766 不是本区 | [zones/monitor/WORKER.md](zones/monitor/WORKER.md) |
| tests | `tests/T01`–`T14`、TEST_INDEX | [zones/tests/WORKER.md](zones/tests/WORKER.md) |

一条改动同时碰模型和实验时：先 rule-pyomo 或 optimization，再 experiments，再 tests。不要并行改同一模块。

## 路径约定

- 本机改代码：优先 `work/server-v1.1-review/`。
- 服务器改代码：仅当 TASK 写明，且限于 `/home/zhouyx/workspace/LEM-DEM-V1.1.20260904.REFACTOR`。
- 监控代码：`server/public/lem_dem_web.py` 与服务器 `/home/zhouyx/workspace/lem-dem-web/`。
- V0.3 知识图谱可视化：服务器 `/home/zhouyx/workspace/LEM-DEM-V0.3.20260907-RuleAgent/`，本机快照 `work/server-v0.3-review/`。运行方式见 `control/A-server-interfaces/graph-web.md`。不要并进 `lem-dem-web`。
- 结果解读：`outputs/` 只读，除非 TASK 要求新增报告 md。
