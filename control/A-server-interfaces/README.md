# A. 服务器接口

本仓库**没有**自建业务 REST API。Agent 能碰到的接口：SSH、GitHub 仓库约定、只读监控 HTTP、V0.3 知识图谱只读 HTTP、V1.1 调用关系只读 HTTP、出站 DeepSeek、本机 COPT 求解器。

| 文件 | 内容 |
|---|---|
| [github.md](github.md) | 代码仓（private）与跨机器公共仓（public） |
| [windows-bootstrap.md](windows-bootstrap.md) | Windows 本机从公共仓拉取 `control/` 并核对 Tailscale / SSH |
| [ssh.md](ssh.md) | `lab-linux` / `win-desktop` |
| [monitor-web.md](monitor-web.md) | FastAPI 只读监控 `127.0.0.1:8765` |
| [graph-web.md](graph-web.md) | V0.3 知识图谱只读可视化 `127.0.0.1:8766` |
| [control-ui.md](control-ui.md) | V1.1 测试/控制器/模块调用关系 `127.0.0.1:8767` |
| [deepseek.md](deepseek.md) | OpenAI 兼容客户端调用 DeepSeek |
| [copt.md](copt.md) | COPT 8.0.6 本机求解器（非 HTTP） |

```text
Mac Cursor Agent
  → SSH lab-linux
      → LEM-DEM V1.1  (run.py)
          → DeepSeek API
          → COPT 8.0.6
          → runtime/outputs
      → lem-dem-web  (127.0.0.1:8765)
          → /home/zhouyx/logs/lem-dem
      → python run.py control-ui  (127.0.0.1:8767)
          → Mac 隧道 work/v1.1-control-ui-tunnel.sock
      → LEM-DEM V0.3  (python run.py graph-web)
          → 127.0.0.1:8766  知识图谱可视化
          → Mac 隧道 work/v0.3-graph-tunnel.sock
```

更早的交接稿（部分路径已过时，以本目录为准）：

- `outputs/SERVER_HANDOFF.md`（2026-09-02）
- `outputs/WEB_CONSOLE_HANDOFF.md`（仍写旧 `LEM-DEM-Design-Platform`）
