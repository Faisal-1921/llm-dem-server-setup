# COPT 求解器（非 HTTP）

优化在 Linux 本机通过 Pyomo 调用 COPT，没有对外 HTTP 端口。

| 项 | 值 |
|---|---|
| 版本 | COPT 8.0.6 |
| `COPT_HOME` | `/home/zhouyx/copt80` |
| `COPT_LICENSE_DIR` | `/home/zhouyx/copt`（`license.dat` / `license.key`，禁止输出内容） |
| `COPT_PYOMO_PATH` | 默认 `/home/zhouyx/copt80/lib/pyomo` |
| 环境脚本 | `server/public/copt_env.sh`；服务器另有 `/home/zhouyx/.copt_env` |
| 适配器 | `work/server-v1.1-review/lem_dem/optimization/solver.py` |
| 配置 | `work/server-v1.1-review/configs/solver/solver_config.json` |

`cli.py` 在派发命令前把 `COPT_PYOMO_PATH` 插入 `sys.path`。

## 求解偏好

```json
"solver_preference": ["copt_direct", "copt_persistent", "scip_pyscipopt"]
```

时限 60s，相对间隙 0.001，单线程。中央适配器会保留 solver log。可选环境变量 `SCIPOPTDIR` 仅用于 SCIP 回退，不是 API Key。

## 入口 / 出口

入口：`python run.py optimize` 以及 `dynamic-units` / `rule-pyomo` / `dynamic-rules` / `rule-components` / `dynamic-components`。

出口：各实验目录下的 `R_*_solver_optimization.log`、`STATUS.json`、调度 CSV/PNG。详见 [C-programs/v1.1-cli.md](../C-programs/v1.1-cli.md)。
