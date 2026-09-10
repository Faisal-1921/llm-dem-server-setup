```yaml
id: clean-v1.1t-test-outputs
status: done
zone: tests
```

## 结论

服务器上没有 `runtime/trstoutputs`。按「测试结果」对应到 1.1.T 副本的 `runtime/test-results/`（JSON / CSV / PNG 图表）。仅删除该目录内结果文件，保留 10 个 `.gitkeep` 与空目录骨架。

- 删除：194,161 个文件（约 4.9GB），含 json / csv / png / log 等
- 未删：`runtime/outputs/`（仍 223M，9386 个文件）、`runtime/logs/`、源码、`tests/`、`data/`、`.env`
- 未碰权威目录：`/home/zhouyx/workspace/LEM-DEM-V1.1.20260904.REFACTOR`（`runtime` 仍 5.3G，test-results 仍 194,161 个文件）

## 证据路径

- `/home/zhouyx/workspace/LEM-DEM-V1.1.T.20260904.REFACTOR-TEST/runtime/test-results`（现 44K，仅 `.gitkeep`）
- `/home/zhouyx/workspace/LEM-DEM-V1.1.T.20260904.REFACTOR-TEST/runtime/outputs`（保留）
- `/home/zhouyx/workspace/LEM-DEM-V1.1.20260904.REFACTOR/runtime/test-results`（未改）

## 未做事项

- 未清空 `runtime/outputs/`（那是实验产物，不是 test-results）。若也要删，需另说。

## 越权检查

否。删除范围仅限 1.1.T 的 `runtime/test-results` 内非 `.gitkeep` 文件。
