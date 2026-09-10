```yaml
id: full-64-rerun
status: running
zone: experiments
created: 2026-09-09
ssh: write-1.1t
```

## 结论

已在 1.1.T 启动全套真实 API + 百轮，**每一类最多 64 并发**，类与类串行（避免 64×N 抢 COPT）。

进程：`pid=1003052` `bash scripts/run_full_realapi_64.sh`  
日志：`/home/zhouyx/logs/lem-dem/t01-t16-full-64.log`  
机器：256 核 / 251Gi，足够 64 进程。

顺序：T01–T05/T08–T11/T13（3 轮）→ T06 105 轮 64 线程 → T07 100 轮 64 线程 → T12 100 轮 64 进程 → T14 100 轮 64 进程 → T15 105 轮池 64 进程 → T16 105 轮池 64 进程。

T15 池内 DeepSeek 仍文件锁串行（每进程一轮 COPT 可 64 路并行）。权威 V1.1 未改。

## 未做事项

- 任务仍在跑，本 REPORT 不代表全绿。
- 未跑 T15 顺序 8760h×3（不是 64 进程池；百轮走 105 轮池）。
