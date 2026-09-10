# 监控服务程序（非 V1.1 CLI）

与 `python run.py` 分离。只监控，不跑实验。

| | |
|---|---|
| 功能 | 只读遥测、目录浏览、日志尾随 |
| 入口 | `/home/zhouyx/bin/lem-dem-web {start\|stop\|restart\|status\|foreground}` |
| 应用 | `/home/zhouyx/workspace/lem-dem-web/lem_dem_web.py` |
| HTTP 出口 | `http://127.0.0.1:8765`（本机需 SSH 隧道） |
| 日志出口 | `/home/zhouyx/logs/lem-dem/web-service.log` |
| 运行结果根 | `/home/zhouyx/logs/lem-dem` |

接口清单见 [A-server-interfaces/monitor-web.md](../A-server-interfaces/monitor-web.md)。

`PROJECT` 浏览的是整个 `/home/zhouyx/workspace`，其中同时有旧 Design-Platform 与 V1.1。看代码时以 `LEM-DEM-V1.1.20260904.REFACTOR` 为准。

V0.3 知识图谱可视化是**另一套**只读服务：`python run.py graph-web`，绑 `127.0.0.1:8766`，隧道 socket 为 `work/v0.3-graph-tunnel.sock`。不要改 `lem-dem-web` 去承载该页，也不要把 8765 改成 8766。见 [v0.3-cli.md](v0.3-cli.md) 与 [A-server-interfaces/graph-web.md](../A-server-interfaces/graph-web.md)。
