# 第一部分
## 题目内容
小明有一天在代码库的时候，发现不知不觉之间，M站的 `Merge Request` 数量已经超过了 1000 了！小明想看看其中有多少是 `code review` 类型的。

所谓的 `code review` 类型，应该满足一下条件：
1. 不是小河狸机器人创建的
2. MR 应该被指派给了某个人，并且这个人不等于 MR 的创建人

小明知道 Gitlab 提供了 API 可以查询 MR，这个工具应该能够实现，正在最近在学习 Elixir， 不如就使用 Elixir 写一个命令行工具，这个工具可以这样用：

```bash
# 查询
crstats --help 

# 用法
crstats show --host <HOST> --repo <REPO>

# 示例
crstats show --host git.hlj.team --repo web/mobile-v3

# 结果
code review stats of `web/mobile-v3` on host `git.hlj.team`

total: 1023
```

恩，第一步这样应该就够了，以后可以慢慢在这个基础核心上包装新的功能。在复杂的功能也能从这样简单的核心开始。

任务：
* 用 Elixir 开发统计 code review 统计的一个命令行工具

技能：
* Elixir

## 解题步骤

1. 找到合适的 gitlab 的 api. [doc](https://docs.gitlab.com/ce/)。
2. 需要是用 HTTP 请求， 所以需要一个 HTTP 请求的库。
3. 返回的是 JSON, 所以需要一个处理 JSON 的库。
4. 根据命令行参数调用 HTTP 请求和对应的 API。
4. 根据条件筛选其中 `code review` 类型。
5. 总结数据
6. 输出

### 1. 找 api
[api_doc](https://docs.gitlab.com/ce/api/README.html) 其中可以找到：
1. [merge_requests_api](https://docs.gitlab.com/ce/api/merge_requests.html)
这个api应该是我们需要的：[projects_merge_request](https://docs.gitlab.com/ce/api/merge_requests.html#list-project-merge-requests)






