# 分区：optimization

## 职责

IEEE-33 Pyomo 连续模型、求解器适配（COPT/SCIP）、结果表导出、solver log。不含规则符号 Agent。

## 允许路径

1.1.T 可写镜像：`work/server-v1.1t/`。权威快照：`work/server-v1.1-review/`。

- `work/server-v1.1t/lem_dem/optimization/model.py`
- `work/server-v1.1-review/lem_dem/optimization/solver.py`
- `work/server-v1.1-review/lem_dem/optimization/results.py`
- `work/server-v1.1-review/lem_dem/models/optimization_case.py`
- `work/server-v1.1-review/configs/solver/`
- `work/server-v1.1-review/data/optimization/`
- `work/server-v1.1-review/lem_dem/experiments/optimize.py`（固定算例入口）
- 只读：`tests/T10_pyomo_optimization/`
- COPT 环境说明：`server/public/copt_env.sh`（不要改许可证文件）

## 入口 / 出口

- 入口：`python run.py T10`
- 出口：`runtime/test-results/T10_pyomo_optimization/`

规则构件注册表 `rule_modules.py` 属于 **rule-pyomo**。本区只在 TASK 明确要求「连续模型与求解器」时动 `model.py` / `solver.py`。

## 禁止

- 不要读取或复制 `COPT_LICENSE_DIR` 下的密钥正文。
- 不要把监听类 HTTP 服务加到求解器上。
- 不要把 DeepSeek 调用写进 solver。
