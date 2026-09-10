```yaml
id: entry-reorg-phase5
status: queued
zone: tests
created: 2026-09-09
ssh: write-1.1t
write_remote: true
```

## 目标

按 `work/plans/2026-09-09-v1.1-entry-reorg.md` 阶段 5 收口审查缺口。实施在本机 `work/server-v1.1t/`，再 rsync 到服务器 1.1.T。禁止改权威 V1.1。

## 分区

`tests`（含文档、control_UI、cli 收口）。库 `DEFAULT_OUTPUT` 改到 `runtime/test-results/Txx_*/` 视为本任务允许路径。

## 允许路径

- `work/server-v1.1t/`（1.1.T 本机镜像）
- `control/C-programs/v1.1-cli.md`、`control/A-server-interfaces/control-ui.md`、`control/A-server-interfaces/deepseek.md`
- `control/D-controller/zones/*/WORKER.md`
- 服务器：`/home/zhouyx/workspace/LEM-DEM-V1.1.T.20260904.REFACTOR-TEST`（rsync，排除 `runtime`）

## 禁止事项

- 不改权威 `/home/zhouyx/workspace/LEM-DEM-V1.1.20260904.REFACTOR`
- 不打印 `.env` / API Key
- 不改 8765/8766/8767 绑定，不加执行接口
- 不默认跑 `--real-api` / 百轮

## 完成标准

1. 每个 T 有 `docs/tests/Txx_*.md`；`Txx.py` docstring 第一段指向该 md
2. `control_UI` 的 TEST_SPECS 从 `tests/TEST_INDEX.md` 生成；页面文案为 `run.py Txx` → 测试流程 → 功能模块
3. 旧实验名默认拒绝；`--legacy` 才转发
4. 库 `DEFAULT_OUTPUT` 指向 `runtime/test-results/Txx_*/`；T12/T14 百轮审计用测试 `RESULT_ROOT`
5. T01 含批量映射用例调用 `lem_dem.experiments.batch`
6. 更新 `v1.1-cli.md`、`docs/file-map.md`、分区 WORKER.md
7. 离线 `python run.py T01`、`T02`、`T08`、`test T02 T08` 通过
