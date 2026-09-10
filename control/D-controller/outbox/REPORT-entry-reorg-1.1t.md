```yaml
id: entry-reorg-1.1t
status: done
zone: tests
```

## 结论

已在 1.1.T 完成入口整理，并依次跑完 T01–T16。权威 V1.1 未改。

- `python run.py Txx` / `python run.py test T11 T14` 为上层指令；`ENABLED_TESTS` 可改默认清单。
- 每个 T 只有 `tests/Txx_<slug>/Txx.py`。T09 修复管线迁到 `lem_dem/mapping_repair.py`；T11 诊断迁到 `scripts/`。
- 百轮证明默认 `--rounds 3`；`--rounds 100`（T06/池 105）接口保留。
- 离线 `python run.py test --rounds 3`：T01–T16 全 OK。
- 真实 API `python run.py test --real-api --rounds 3`：T01–T16 全 OK。跳过的是 100 轮落盘审计与 T15 全年 8760h 审计。

## 证据路径

- `/home/zhouyx/workspace/LEM-DEM-V1.1.T.20260904.REFACTOR-TEST/`
- `/home/zhouyx/logs/lem-dem/t01-t16-offline.log`
- `/home/zhouyx/logs/lem-dem/t01-t16-realapi-3.log`
- 本机工作副本 `work/server-v1.1t/`
- `docs/tests/REAL_API.md`

## 未做事项

- 未跑 `--rounds 100` 全量百轮。
- 未改权威 `/home/zhouyx/workspace/LEM-DEM-V1.1.20260904.REFACTOR`。
- 未提交 git。

## 越权检查

否。只写 1.1.T；未打印 `.env`。
