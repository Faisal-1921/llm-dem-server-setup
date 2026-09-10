```yaml
id: entry-reorg-phase5
status: done
zone: tests
```

## 结论

1.1.T 阶段 5 已收口：`TEST_INDEX.md` 生成 control_UI 测试表；页面文案改为 `run.py Txx` → 测试流程 → 功能模块；T01–T16 均有 `docs/tests/Txx_*.md` 且 `Txx.py` docstring 第一段指向它们；旧实验名默认拒绝（`--legacy` 才转发）；库 `DEFAULT_OUTPUT` 改到 `runtime/test-results/Txx_*/`；T01 增加批量映射用例。权威 V1.1 未改。

离线：`python run.py T01`（10 项含 batch）、`T02`、`T08`、`test T02 T08` 全过。`python run.py map` 退出码 2。

## 证据路径

- 本机：`work/server-v1.1t/`
- 服务器：`/home/zhouyx/workspace/LEM-DEM-V1.1.T.20260904.REFACTOR-TEST`
- 计划对照：`work/plans/2026-09-09-v1.1-entry-reorg-AUDIT.md`
- Mac 文档：`control/C-programs/v1.1-cli.md`、分区 `WORKER.md`

## 未做事项

- 未重跑 `--real-api` / 百轮（本 TASK 禁止）。
- 未重启 8767 上可能仍在跑的权威 V1.1 `control-ui` 进程；图结构用 `build_graph()` 在 1.1.T 源码里验过。
- `python -m lem_dem.experiments.*` 的 `main()` 仍可绕开 `run.py`（已在 file-map 写明不是用户入口）。

## 越权检查

否。未改权威目录，未读 `.env`，未改 8765/8766/8767 绑定。
