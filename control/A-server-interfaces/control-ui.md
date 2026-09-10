# 调用关系可视化（control_UI）

与 `lem-dem-web`（`127.0.0.1:8765`）和 V0.3 知识图谱（`127.0.0.1:8766`）分开。本服务只展示 `run.py Txx` → `Txx.py` → 功能模块，不跑实验、不写文件。

当前 8767 **服务于 1.1.T TEST 树**，不要把它当成权威 V1.1 产品树。权威代码仍是 `LEM-DEM-V1.1.20260904.REFACTOR`。

| 项 | 值 |
|---|---|
| 服务 | LEM-DEM 1.1.T Control UI |
| 框架 | 标准库 `http.server`（`ThreadingHTTPServer`） |
| 服务器源码 | `/home/zhouyx/workspace/LEM-DEM-V1.1.T.20260904.REFACTOR-TEST/control_UI/` |
| 本机快照 | `work/server-v1.1t/control_UI/` |
| 入口 | 1.1.T 项目根 `python run.py control-ui` |
| 绑定 | **仅** `127.0.0.1:8767`（禁止 `0.0.0.0`；不要占用 8765 / 8766） |
| 鉴权 | 无。远程访问必须走 SSH 隧道 |
| PID | `/home/zhouyx/tmp/v1.1-control-ui.pid` |
| 服务日志 | `/home/zhouyx/logs/lem-dem/control-ui.log` |
| Python | `/home/zhouyx/miniforge3/envs/project/bin/python` |

无 WebSocket、无 gRPC、无写接口。不要给该页增加执行命令、提交任务、编辑或删除文件的能力。`--host` 只允许 `127.0.0.1` 或 `localhost`。

## HTTP 接口（全部 GET）

| 方法 | 路径 | 作用 |
|---|---|---|
| GET | `/` | 三列调用关系 HTML |
| GET | `/healthz` | `{status, mode, bind}`，`mode=callgraph-viewer-only` |
| GET | `/api/graph` | 测试 / 控制器 / 模块节点与边 |
| GET | `/api/module?id=` | 该节点的简要 Markdown（AST 扫描公开函数/类） |

写方法预期 HTTP 405。不提供任意文件浏览，不读取 `.env`。`id` 只能是图上的 `test:` / `ctrl:` / `mod:` 节点。

## 服务管理（经 SSH）

工作目录必须是 **1.1.T** 项目根。后台：

```bash
ssh -F /Users/mike/Documents/Monitor_Server/configs/ssh_config_linux lab-linux \
  'source /home/zhouyx/miniforge3/etc/profile.d/conda.sh && conda activate project && \
   cd /home/zhouyx/workspace/LEM-DEM-V1.1.T.20260904.REFACTOR-TEST && \
   mkdir -p /home/zhouyx/tmp /home/zhouyx/logs/lem-dem && \
   nohup python run.py control-ui \
     > /home/zhouyx/logs/lem-dem/control-ui.log 2>&1 & \
   echo $! > /home/zhouyx/tmp/v1.1-control-ui.pid'
```

状态 / 停止：

```bash
ssh -F /Users/mike/Documents/Monitor_Server/configs/ssh_config_linux lab-linux \
  'test -f /home/zhouyx/tmp/v1.1-control-ui.pid && \
   kill -0 "$(cat /home/zhouyx/tmp/v1.1-control-ui.pid)" && echo running || echo stopped'

ssh -F /Users/mike/Documents/Monitor_Server/configs/ssh_config_linux lab-linux \
  'kill "$(cat /home/zhouyx/tmp/v1.1-control-ui.pid)"'
```

## Mac SSH 隧道

服务只听 loopback。本机打开 `http://127.0.0.1:8767/` 前先建隧道（socket 与 8765 / 8766 分开）：

```bash
ssh -fN -M \
  -S /Users/mike/Documents/Monitor_Server/work/v1.1-control-ui-tunnel.sock \
  -o ExitOnForwardFailure=yes \
  -L 8767:127.0.0.1:8767 \
  -F /Users/mike/Documents/Monitor_Server/configs/ssh_config_linux \
  lab-linux
```

检查 / 关隧道：

```bash
ssh -S /Users/mike/Documents/Monitor_Server/work/v1.1-control-ui-tunnel.sock -O check \
  -F /Users/mike/Documents/Monitor_Server/configs/ssh_config_linux lab-linux
curl -fsS http://127.0.0.1:8767/healthz

ssh -S /Users/mike/Documents/Monitor_Server/work/v1.1-control-ui-tunnel.sock -O exit \
  -F /Users/mike/Documents/Monitor_Server/configs/ssh_config_linux lab-linux
```

Mac 重启后通常要重建隧道；Linux 重启后要重新 `python run.py control-ui`。

## 与另外两个 Web 的区别

| 端口 | 名字 | 项目 | 隧道 socket |
|---|---|---|---|
| 8765 | 监视器 | `lem-dem-web`（日志/进程只读） | `work/lem-dem-tunnel.sock` |
| 8766 | 知识图谱 | V0.3 `graph-web` | `work/v0.3-graph-tunnel.sock` |
| **8767** | **调用关系** | **1.1.T `control_UI`（非权威 V1.1）** | **`work/v1.1-control-ui-tunnel.sock`** |

不要把本页并进 `lem-dem-web`，也不要把 8767 改成 8765/8766。
