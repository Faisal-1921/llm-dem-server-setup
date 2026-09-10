# SSH 接口

本机配置在 `configs/`。所有 Linux SSH 使用 `-F` 指向本仓库配置，不要改成 `StrictHostKeyChecking=no`。

## lab-linux（服务器，计算入口）

| 项 | 值 |
|---|---|
| 别名 | `lab-linux` |
| 主机名 | `eilab-8315` |
| HostName | `111.204.214.66` |
| 用户 | `zhouyx` |
| 端口 | 22 |
| OS | Ubuntu 24.04.2 LTS，x86_64 |
| 本机配置 | `configs/ssh_config_linux` |
| 本机私钥路径（只记路径） | `/Users/mike/.ssh/id_rsa` |
| known_hosts | `configs/known_hosts_linux` |
| 已确认主机指纹 | `SHA256:Vn8tOMs0iShu3J9S+O1f9xAUI4Y+MOqI0ZYHHMJGl+Q` |

```bash
ssh -F /Users/mike/Documents/Monitor_Server/configs/ssh_config_linux lab-linux
```

只读连通检查：

```bash
ssh -F /Users/mike/Documents/Monitor_Server/configs/ssh_config_linux lab-linux \
  'id -un; hostname; pwd'
```

允许操作的用户目录：`/home/zhouyx/{workspace,data,logs,tmp,bin,miniforge3}`。不要改系统目录、Docker、MicroK8s。

Python：`/home/zhouyx/miniforge3/envs/project/bin/python`。进入环境：

```bash
source /home/zhouyx/miniforge3/etc/profile.d/conda.sh
conda activate project
```

Mac Tailscale IPv4：`100.89.169.97`。

## win-desktop（「连接」默认目标，非计算入口）

| 项 | 值 |
|---|---|
| 别名 | `win-desktop` |
| HostName | `100.110.230.14` |
| 用户 | `mike_` |
| 端口 | 22 |
| 本机配置 | `configs/ssh_config_windows` |
| 本机私钥路径（只记路径） | `/Users/mike/.ssh/id_ed25519` |
| 远程桌面 | RustDesk → `100.110.230.14` |

用户说「连接」时用 RustDesk，不要把密码写入命令或 md。断开时关闭 RustDesk 会话，不要关机 Windows。

```bash
open -a RustDesk --args --connect 100.110.230.14
```

## 过时路径

`outputs/SERVER_HANDOFF.md` 里的 `-F .../Codex/2026-09-01/trilscale/.server-launcher/ssh_config_linux` 是旧交接路径。本控制平面使用仓库内 `configs/ssh_config_linux`。
