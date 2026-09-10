# V0.3 知识图谱只读可视化

与 `lem-dem-web`（`127.0.0.1:8765`）分开。本服务只展示 V0.3 市场设计知识库种子图，不跑实验、不写文件。

| 项 | 值 |
|---|---|
| 服务 | LEM-DEM V0.3 Knowledge Graph Viewer |
| 框架 | 标准库 `http.server`（`ThreadingHTTPServer`） |
| 服务器源码 | `/home/zhouyx/workspace/LEM-DEM-V0.3.20260907-RuleAgent/lem_dem/knowledge_graph/web.py` |
| 页面 | `lem_dem/knowledge_graph/static/index.html` |
| 本机快照 | `work/server-v0.3-review/lem_dem/knowledge_graph/` |
| 入口 | 项目根 `python run.py graph-web` |
| 绑定 | **仅** `127.0.0.1:8766`（禁止改成 `0.0.0.0`；不要占用 8765） |
| 鉴权 | 无。远程访问必须走 SSH 隧道 |
| PID | `/home/zhouyx/tmp/v0.3-graph-web.pid` |
| 服务日志 | `/home/zhouyx/workspace/LEM-DEM-V0.3.20260907-RuleAgent/runtime/outputs/R_20_knowledge_graph/graph-web.log` |
| 图谱 JSON | 同目录 `G01_market_node_reference.json`（缺则启动时由 Excel 01–04 生成） |
| Python | `/home/zhouyx/miniforge3/envs/project/bin/python` |

无 WebSocket、无 gRPC、无写接口。不要给该页增加执行命令、提交任务、编辑或删除文件的能力。`--host` 只允许 `127.0.0.1` 或 `localhost`。

## HTTP 接口（全部 GET）

| 方法 | 路径 | 作用 |
|---|---|---|
| GET | `/` | HTML 图例可视化（分层有向图 + Schema 检视） |
| GET | `/healthz` | `{status, mode, bind}`，`mode=graph-viewer-only` |
| GET | `/api/graph` | 市场规则图 JSON（26 节点、37 边、主流/全图路径） |
| GET | `/api/schema-index` | Schema 库路径索引 |

写方法预期 HTTP 405。其它路径 404。不提供任意文件浏览，不读取 `.env`。

## 服务管理（经 SSH）

工作目录必须是 V0.3 项目根。前台：

```bash
ssh -F /Users/mike/Documents/Monitor_Server/configs/ssh_config_linux lab-linux \
  'source /home/zhouyx/miniforge3/etc/profile.d/conda.sh && conda activate project && \
   cd /home/zhouyx/workspace/LEM-DEM-V0.3.20260907-RuleAgent && python run.py graph-web'
```

后台（当前实验室用法）：

```bash
ssh -F /Users/mike/Documents/Monitor_Server/configs/ssh_config_linux lab-linux \
  'source /home/zhouyx/miniforge3/etc/profile.d/conda.sh && conda activate project && \
   cd /home/zhouyx/workspace/LEM-DEM-V0.3.20260907-RuleAgent && \
   mkdir -p /home/zhouyx/tmp runtime/outputs/R_20_knowledge_graph && \
   nohup python run.py graph-web \
     > runtime/outputs/R_20_knowledge_graph/graph-web.log 2>&1 & \
   echo $! > /home/zhouyx/tmp/v0.3-graph-web.pid'
```

状态 / 停止：

```bash
ssh -F /Users/mike/Documents/Monitor_Server/configs/ssh_config_linux lab-linux \
  'test -f /home/zhouyx/tmp/v0.3-graph-web.pid && \
   kill -0 "$(cat /home/zhouyx/tmp/v0.3-graph-web.pid)" && echo running || echo stopped'

ssh -F /Users/mike/Documents/Monitor_Server/configs/ssh_config_linux lab-linux \
  'kill "$(cat /home/zhouyx/tmp/v0.3-graph-web.pid)"'
```

## Mac SSH 隧道

服务只听 loopback。本机打开 `http://127.0.0.1:8766/` 前先建隧道（socket 与 8765 监控隧道分开）：

```bash
ssh -fN -M \
  -S /Users/mike/Documents/Monitor_Server/work/v0.3-graph-tunnel.sock \
  -o ExitOnForwardFailure=yes \
  -L 8766:127.0.0.1:8766 \
  -F /Users/mike/Documents/Monitor_Server/configs/ssh_config_linux \
  lab-linux
```

检查 / 关隧道：

```bash
ssh -S /Users/mike/Documents/Monitor_Server/work/v0.3-graph-tunnel.sock -O check \
  -F /Users/mike/Documents/Monitor_Server/configs/ssh_config_linux lab-linux
curl -fsS http://127.0.0.1:8766/healthz

ssh -S /Users/mike/Documents/Monitor_Server/work/v0.3-graph-tunnel.sock -O exit \
  -F /Users/mike/Documents/Monitor_Server/configs/ssh_config_linux lab-linux
```

Mac 重启后通常要重建隧道；Linux 重启后要重新 `python run.py graph-web`。

## 注意

- 不要与 [monitor-web.md](monitor-web.md) 混用端口或 PID。
- 这不是最新业务入口。计算仍以 V1.1 为准；本页只可视化 V0.3 知识图谱。
- 程序入口与 CLI 对照见 [C-programs/v0.3-cli.md](../C-programs/v0.3-cli.md)。
