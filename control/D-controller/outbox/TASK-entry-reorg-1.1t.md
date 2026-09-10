```yaml
id: entry-reorg-plan
status: queued
zone: tests
created: 2026-09-09
ssh: read-only-optional
write_remote: false
```

## 目标

审查已完成。实施前必须先读计划全文，且用户确认「开始阶段 N」后再改代码。

计划：`work/plans/2026-09-09-v1.1-entry-reorg.md`（已补：手选本次 T、一 T 一 `Txx.py`、真实 API md 与结构一致性）。

## 分区

首阶段实施时用 `tests`（见计划第 7 节）。**当前 TASK 只挂起，不实施。**

## 允许路径

实施前：无写入。

## 禁止事项

- 未确认阶段号之前不改 `cli.py` / 测试 / 1.1.T。
- 不改权威 V1.1。
- 未用户明示阶段 6b 前不跑 `--real-api`。

## 完成标准

用户回复「开始阶段 1」后，把本 TASK 移到 active 并按计划第 10 节指令执行。
