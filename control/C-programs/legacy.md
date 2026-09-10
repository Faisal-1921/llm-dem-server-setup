# 历史副本（禁止当最新入口）

干活 Agent 不要在这些树上改代码或当作 `run.py` 来源，除非任务**明确**说在做考古/对比。

| 路径 | 是什么 | 为何过时 |
|---|---|---|
| `work/LEM-DEM-Design-Platform/` | V0.1，`C_01_main_controller.py` 等扁平 A_/C_/M_ | 已被 V1.1 `lem_dem/` 取代。GitHub 私有代码仓目前也是这一代，不是 V1.1 |
| `work/LEM-DEM-Design-Platform-copt-interface/` | V0.2 + Pyomo/COPT，`C_01`–`C_07` | 同上 |
| `server/public/lem-dem` | bash 包装 | **仍指向** `/home/zhouyx/workspace/LEM-DEM-Design-Platform` |
| `lab-linux-file-tree.md` | 2026-09-04 只读扫描 | 当时顶层只有 V0.1/V0.2 与 `lem-dem-web`，无 V1.1 |
| `LEM-DEM-rule-driven-pyomo-python/` | 规则链路 Python 子集 | 无完整 T14 CLI / 测试树 |
| `LEM-DEM-rule-driven-pyomo-audit-bundle/` | 审计包（源码+证据） | 快照，不是运行入口 |
| `outputs/SERVER_HANDOFF.md` / `WEB_CONSOLE_HANDOFF.md` | 2026-09-02 交接 | `server_project` 仍写 Design-Platform |
| `LEM-DEM-internal-directory-recommendations.md` | 目录建议 | 未执行；V1.1 已按另一套结构落地 |

服务器上旧目录可能仍在：

```text
/home/zhouyx/workspace/LEM-DEM-V0.1.20260902.BASE/
/home/zhouyx/workspace/LEM-DEM-V0.2.20260903.COPT/
/home/zhouyx/workspace/LEM-DEM-Design-Platform/
```

最新只认：

```text
/home/zhouyx/workspace/LEM-DEM-V1.1.20260904.REFACTOR
```

本控制平面**不**修正 `server/public/lem-dem` 包装脚本，只在此标注。
