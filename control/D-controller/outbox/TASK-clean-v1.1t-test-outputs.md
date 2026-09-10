```yaml
id: clean-v1.1t-test-outputs
status: queued
zone: tests
created: 2026-09-09
ssh: write-allowed
write_remote: true
```

## 目标

用户明示：只删除 1.1.T 副本中的测试结果文件，路径意图为 `runtime/trstoutputs`（含 JSON、数据、图表）。严禁删除其他文件。不碰权威 V1.1 源目录。

先核对实际目录名（文档中常见 `runtime/test-results/`、`runtime/outputs/`），只清空确认后的测试结果树内文件。

## 分区

`tests`

## 允许路径（写入/删除仅限此树）

- `/home/zhouyx/workspace/LEM-DEM-V1.1.T.20260904.REFACTOR-TEST/runtime/` 下**已确认的测试结果目录**

## 禁止事项

- 不删除 `lem_dem/`、`tests/`、`data/`、`run.py`、`.env`、`pyproject.toml` 等源码与配置。
- 不删除权威目录 `/home/zhouyx/workspace/LEM-DEM-V1.1.20260904.REFACTOR` 内任何文件。
- 不打印 `.env` 或密钥。
- 若找不到明确的测试结果目录，标 blocked，不要猜测删除。

## 完成标准

1. 列出删除前的目标目录与规模。
2. 仅删除该目录内测试结果（JSON/图表等）。
3. 源码与权威 V1.1 仍在。
