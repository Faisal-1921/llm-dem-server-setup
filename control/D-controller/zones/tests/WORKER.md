# 分区：tests

## 职责

T01–T16 回归、TEST_INDEX、fixtures。不改被测实现，除非 TASK 写成「测试与实现一起改」（此时应由高级 Agent 拆成两区或写明双路径授权）。

## 允许路径

1.1.T 可写镜像：`work/server-v1.1t/`。权威快照：`work/server-v1.1-review/`。

- `work/server-v1.1t/tests/`
- `work/server-v1.1t/tests/TEST_INDEX.md`
- 只读：`work/server-v1.1-review/data/`
- 产物只读：`runtime/test-results/`（服务器）或本机对应 `outputs/`

## 入口 / 出口

```bash
python run.py test
python run.py T14
python run.py test T02 T08
python run.py test --real-api
```

出口：`runtime/test-results/Txx_*/`。索引见 `tests/TEST_INDEX.md`。

真实 API 测试会消费 DeepSeek 并可能跑 COPT。未在 TASK 写明 `--real-api` 时只跑离线测试。

## 禁止

- 不要把共享 `data/` 复制进每个测试目录。
- 不要提交真实 `.env`。
- 不要把失败的真实 API 响应里的密钥记进 REPORT。
