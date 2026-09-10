# C. 程序入口、出口与功能

**唯一最新版本是 LEM-DEM V1.1。**

| 角色 | 路径 |
|---|---|
| 服务器权威代码 | `/home/zhouyx/workspace/LEM-DEM-V1.1.20260904.REFACTOR` |
| 本机快照（含 T14） | `work/server-v1.1-review/` |
| 包版本 | `pyproject.toml` → `1.1.0` |
| 用户入口 | `run.py` → `lem_dem/cli.py` |
| 等价入口 | `python -m lem_dem`；安装后控制台命令 `lem-dem` |
| 公共输入 | `data/` |
| 运行产物 | `runtime/outputs/`、`runtime/test-results/` |
| 本机 T14 镜像 | `outputs/LEM-DEM-T14-REAL-100-ROUND-20260907/` |

在服务器上：

```bash
cd /home/zhouyx/workspace/LEM-DEM-V1.1.20260904.REFACTOR
source /home/zhouyx/miniforge3/etc/profile.d/conda.sh
conda activate project
python run.py --help
```

| 文件 | 内容 |
|---|---|
| [v1.1-cli.md](v1.1-cli.md) | 全部 `run.py Txx`：测试文件、库模块、默认出口 |
| [v0.3-cli.md](v0.3-cli.md) | V0.3 RuleAgent 脚手架（非最新业务入口）：`test-api` / `graph` / `graph-web` |
| [v0.3-schema-prompt.md](v0.3-schema-prompt.md) | 给其它 Agent 的市场规则 Schema 类型 Prompt |
| [monitor-web.md](monitor-web.md) | 监控服务入口/出口（8765；与 V0.3 图谱页 8766、V1.1 control_UI 8767 分开） |
| [legacy.md](legacy.md) | 禁止当作最新入口的历史副本 |

`cli.py` 只做测试分发，不含业务逻辑。整理后的入口是 `python run.py Txx`。
