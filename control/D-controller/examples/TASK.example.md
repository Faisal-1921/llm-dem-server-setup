# TASK 事例：解读 T14 并核对入口

```yaml
id: t14-readout
status: queued
zone: experiments
created: 2026-09-07
ssh: read-only-optional
write_remote: false
```

## 目标

确认当前最新实验是 T14 混合整数规则构件百轮，入口命令为 `python run.py dynamic-components`，并对照本机产物与 CLI 默认出口是否一致。

## 分区

`experiments`（只读）。不要改 `rule_modules.py`。

## 允许路径

- `work/server-v1.1-review/lem_dem/cli.py`（只读，核对 COMMANDS）
- `work/server-v1.1-review/lem_dem/experiments/dynamic_rule_components.py`（只读）
- `outputs/LEM-DEM-T14-REAL-100-ROUND-20260907/`
- `control/C-programs/v1.1-cli.md`（只读）

## 禁止事项

- 不调用真实 DeepSeek，不在服务器重跑 100 轮。
- 不读取 `.env` 或 COPT 许可证正文。
- 不把 Design-Platform 的 `C_07_*` 当成 T14 入口。

## 完成标准

1. 写出入口模块名与默认出口目录名 `R_18_dynamic_rule_components_100_rounds`。
2. 引用本机 `T14实验报告.md` 中的 100/100 成功结论（不要抄密钥）。
3. 若 CLI 与报告不一致，在 REPORT 里标 blocked 原因，而不是自行改代码。
