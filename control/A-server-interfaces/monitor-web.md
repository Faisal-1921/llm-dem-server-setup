# 只读监控 Web

| 项 | 值 |
|---|---|
| 服务 | LEM-DEM Read-only Monitor v2.0.0 |
| 框架 | FastAPI → Uvicorn |
| 服务器源码 | `/home/zhouyx/workspace/lem-dem-web/lem_dem_web.py` |
| 本机副本 | `server/public/lem_dem_web.py`、`work/server-web-review/lem_dem_web.py` |
| 管理脚本 | `/home/zhouyx/bin/lem-dem-web`（本机副本 `server/public/lem-dem-web`） |
| 绑定 | **仅** `127.0.0.1:8765`（禁止改成 `0.0.0.0`） |
| 鉴权 | 无。远程访问必须走 SSH 隧道 |
| PID | `/home/zhouyx/tmp/lem-dem-web.pid` |
| 服务日志 | `/home/zhouyx/logs/lem-dem/web-service.log` |
| 运行日志根 | `/home/zhouyx/logs/lem-dem` |
| Python | `/home/zhouyx/miniforge3/envs/project/bin/python` |

无 WebSocket、无 gRPC、无写接口。不要给控制台增加执行命令、提交任务、编辑或删除文件的能力。

## 可见根

| `root` 查询参数 | 绝对路径 |
|---|---|
| `home` | `/home/zhouyx` |
| `project` | `/home/zhouyx/workspace` |
| `results` | `/home/zhouyx/logs/lem-dem` |

敏感名（`.env`、`.ssh`、私钥、`*.key` / `*.pem` 等）返回 403。路径不得逃出所选根。

## HTTP 接口（全部 GET）

| 方法 | 路径 | 作用 |
|---|---|---|
| GET | `/` | HTML 监控页 |
| GET | `/healthz` | `{status, mode}`，`mode=monitor-only` |
| GET | `/api/status` | 主机遥测；含布尔 `api_key_configured`，**不回传密钥** |
| GET | `/api/processes` | 监控用户下的 python/conda 等进程 |
| GET | `/api/runs` | 由日志目录汇总的运行历史 |
| GET | `/api/tree?root=&path=` | 目录列表，最多 500 项 |
| GET | `/api/preview?root=&path=` | 文本预览（≤1.5MB；txt/log/md/json/csv/py/yml/yaml/toml） |
| GET | `/api/file?root=&path=` | 仅图片（png/jpg/jpeg/gif/svg） |
| GET | `/api/logs` | 日志索引 |
| GET | `/api/log-tail?path=&lines=` | 结果根下 `.log` 尾部（20–600 行，默认 160） |

写方法预期 HTTP 405。

## 服务管理（经 SSH）

```bash
ssh -F /Users/mike/Documents/Monitor_Server/configs/ssh_config_linux \
  lab-linux '/home/zhouyx/bin/lem-dem-web status'
# start | stop | restart | status | foreground
```

## Mac SSH 隧道

服务只听 loopback。本机打开 `http://127.0.0.1:8765` 前先建隧道：

```bash
ssh -fN -M \
  -S /Users/mike/Documents/Monitor_Server/work/lem-dem-tunnel.sock \
  -o ExitOnForwardFailure=yes \
  -L 8765:127.0.0.1:8765 \
  -F /Users/mike/Documents/Monitor_Server/configs/ssh_config_linux \
  lab-linux
```

检查 / 关隧道：

```bash
ssh -S /Users/mike/Documents/Monitor_Server/work/lem-dem-tunnel.sock -O check \
  -F /Users/mike/Documents/Monitor_Server/configs/ssh_config_linux lab-linux
curl -fsS http://127.0.0.1:8765/healthz

ssh -S /Users/mike/Documents/Monitor_Server/work/lem-dem-tunnel.sock -O exit \
  -F /Users/mike/Documents/Monitor_Server/configs/ssh_config_linux lab-linux
```

Mac 重启后通常要重建隧道；Linux 重启后要重新 `lem-dem-web start`。

## 注意

`/api/status` 的 `api_key_configured` 读取的是 **`/home/zhouyx/workspace/.env`**，与 V1.1 项目 `.env` 可能不是同一文件。见 [B-api-keys](../B-api-keys/README.md)。

V0.3 知识图谱可视化是另一端口：`127.0.0.1:8766`，隧道 `work/v0.3-graph-tunnel.sock`。见 [graph-web.md](graph-web.md)。不要把本监控服务改到 8766。
