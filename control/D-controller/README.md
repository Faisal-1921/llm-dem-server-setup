# D. 控制器：用 Markdown 分发

高级 Agent 不直接改各分区代码。它把任务写成 md，交给**一个**分区干活 Agent；跨区由高级 Agent 串行协调。

没有调度脚本、没有自动拉起子 Agent。黑板就是这些文件。

| 文件 | 作用 |
|---|---|
| [ORCHESTRATOR.md](ORCHESTRATOR.md) | 高级 Agent 人设与硬规则 |
| [protocol.md](protocol.md) | 状态机、文件名、分区边界 |
| [zones/*/WORKER.md](zones/) | 各分区允许路径与职责 |
| [examples/](examples/) | TASK / STATUS / REPORT 事例 |
| `inbox/` | 新任务（空，仅 `.gitkeep`） |
| `active/` | 进行中 |
| `outbox/` | 完成报告 |

```text
用户任务
  → 高级 Agent 读 ORCHESTRATOR + A/B/C
  → 写入 inbox/TASK-*.md
  → 指定 zones/<分区>/WORKER.md
  → 干活 Agent 把任务移到 active/ 并更新 STATUS
  → 完成后写 outbox/REPORT-*.md
  → 高级 Agent 汇总
```
