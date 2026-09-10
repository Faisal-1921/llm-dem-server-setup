# REPORT 事例

```yaml
id: t14-readout
status: done
zone: experiments
```

## 结论

T14 的用户入口是 V1.1 的 `python run.py dynamic-components`。实现模块是 `lem_dem.experiments.dynamic_rule_components`。默认出口是项目内 `runtime/outputs/R_18_dynamic_rule_components_100_rounds/`。本机镜像目录 `outputs/LEM-DEM-T14-REAL-100-ROUND-20260907/` 含同名 `R_18_*` 产物与 `T14实验报告.md`。报告记载 100/100 轮真实 DeepSeek + COPT 混合整数最优，独立审计 2000 件产物通过。

与 T13 的关系：T13 入口是 `rule-components`（单轮互斥块）；T14 把同一构件合同扩展为随机百轮 MIP。不要用旧 `C_07_dynamic_units_pyomo_experiment_controller.py`。

## 证据路径

- `work/server-v1.1-review/lem_dem/cli.py`（`dynamic-components` 项）
- `work/server-v1.1-review/lem_dem/experiments/dynamic_rule_components.py`（`DEFAULT_OUTPUT`）
- `outputs/LEM-DEM-T14-REAL-100-ROUND-20260907/T14实验报告.md`
- `outputs/LEM-DEM-T14-REAL-100-ROUND-20260907/R_18_dynamic_rule_components_100_rounds/R_08_experiment_summary.json`

## 未做事项

- 未 SSH 到服务器核对 `runtime/outputs` 是否仍在。
- 未重跑任何 API 或 COPT。

## 越权检查

否。未修改源码，未打开 `.env`。
