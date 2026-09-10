```yaml
id: copy-v1.1-test
status: queued
zone: tests
created: 2026-09-09
ssh: write-allowed
write_remote: true
```

## 目标

用户明示：在 Linux `lab-linux` 的 `/home/zhouyx/workspace` 复制权威 V1.1 项目。
目标目录名 = 原名，把 `1.1` 改为 `1.1.T`，末尾加 `-TEST`：

`/home/zhouyx/workspace/LEM-DEM-V1.1.T.20260904.REFACTOR-TEST`

源目录保持不动：`/home/zhouyx/workspace/LEM-DEM-V1.1.20260904.REFACTOR`

## 分区

`tests`（工作区副本，不改权威源码）。串行：须等 `start-monitor` 完成后再执行。

## 允许路径

- 源（只读）：`/home/zhouyx/workspace/LEM-DEM-V1.1.20260904.REFACTOR`
- 目标（写入）：`/home/zhouyx/workspace/LEM-DEM-V1.1.T.20260904.REFACTOR-TEST`

## 禁止事项

- 不修改、不删除源目录。
- 不打印 `.env`、API Key、COPT 许可证、SSH 私钥。
- 不把副本当最新权威入口写回 `control/` 文档（权威仍是无 `.T` / 无 `-TEST` 的目录）。
- 不改系统目录、Docker、MicroK8s。
- 若目标已存在且非空，先在 STATUS 标 blocked，不要覆盖，除非确认是同一次任务的半成品。

## 完成标准

1. 目标目录存在，且含 `run.py`、`lem_dem/`、`pyproject.toml`。
2. 源目录仍在且未被改动。
3. REPORT 写出源路径、目标路径、复制命令、目录规模摘要（不含密钥）。
