# 分区：monitor

## 职责

只读 Web 监控、SSH 隧道、`lem-dem-web` 启停状态。保持 monitor-only。

## 允许路径

- `server/public/lem_dem_web.py`
- `server/public/lem-dem-web`
- `work/server-web-review/lem_dem_web.py`
- `configs/ssh_config_linux`、`configs/ssh_config_windows`（只读，除非 TASK 明确改 SSH 配置）
- 服务器：`/home/zhouyx/workspace/lem-dem-web/`、`/home/zhouyx/bin/lem-dem-web`（须 TASK 授权写入）

## 入口 / 出口

- 入口：`lem-dem-web start|status|stop`
- HTTP：`http://127.0.0.1:8765`（经隧道）
- 日志：`/home/zhouyx/logs/lem-dem/web-service.log`

细节：[A-server-interfaces/monitor-web.md](../../../A-server-interfaces/monitor-web.md)

V0.3 `python run.py graph-web`（`127.0.0.1:8766`）不是本区任务。接口与隧道见 [A-server-interfaces/graph-web.md](../../../A-server-interfaces/graph-web.md)。

## 禁止

- 不要增加 POST/执行/上传/删除。
- 不要把 host 改成 `0.0.0.0`。
- 不要放松 `.env` / 私钥 403。
- 不要把 Windows RustDesk 流程写进 Linux 监控服务。
- 写请求应继续 405。
