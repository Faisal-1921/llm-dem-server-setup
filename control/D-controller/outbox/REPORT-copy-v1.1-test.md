```yaml
id: copy-v1.1-test
status: done
zone: tests
```

## 结论

已在 Linux `/home/zhouyx/workspace` 完整复制 V1.1。源目录未改。新副本名为原名把 `1.1` 改为 `1.1.T`，末尾加 `-TEST`。权威入口仍是无 `.T` / 无 `-TEST` 的目录。

- 源：`/home/zhouyx/workspace/LEM-DEM-V1.1.20260904.REFACTOR`（仍在，含 `run.py`）
- 目标：`/home/zhouyx/workspace/LEM-DEM-V1.1.T.20260904.REFACTOR-TEST`（含 `run.py`、`lem_dem/`、`pyproject.toml`）
- 规模：两侧均为 5.3G（约 222,562 个文件；`runtime/` 占绝大部分）
- 命令：`rsync -a --info=stats2 SRC/ DST/`

`.env` 仅确认存在且权限 `600`，未读取内容。

## 证据路径

- `/home/zhouyx/workspace/LEM-DEM-V1.1.20260904.REFACTOR`
- `/home/zhouyx/workspace/LEM-DEM-V1.1.T.20260904.REFACTOR-TEST`
- `control/D-controller/outbox/REPORT-start-monitor.md`（前置监控任务）

## 未做事项

- 未在副本上运行 `python run.py` 或测试。
- 未改 `control/` 文档里的权威路径。
- 未启动 8766 / 8767。

## 越权检查

否。只新增目标目录；未改源码、系统目录；未打印密钥。
