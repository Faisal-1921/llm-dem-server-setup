```yaml
id: start-monitor
status: done
zone: monitor
```

## 结论

Linux `lab-linux` 上 `lem-dem-web` 已在跑（PID 767201，绑定 `http://127.0.0.1:8765`，`mode=monitor-only`）。本次未重启服务。本机新建 SSH 隧道 `work/lem-dem-tunnel.sock`（master pid 22520）。`GET /healthz` 返回 `{"status":"ok","mode":"monitor-only"}`。本机打开 `http://127.0.0.1:8765` 即可看只读监控页。

## 证据路径

- 服务器：`/home/zhouyx/bin/lem-dem-web status` → running PID=767201
- 本机隧道：`work/lem-dem-tunnel.sock`
- HTTP：`http://127.0.0.1:8765/healthz`

## 未做事项

- 未改监控源码或绑定地址。
- 未启动 8766 / 8767。

## 越权检查

否。未读取 `.env`，未改 `0.0.0.0`。
