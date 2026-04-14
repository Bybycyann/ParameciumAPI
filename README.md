# ParameciumAPI

> 在纯 Datapack 基础上优化 mcfunction 开发体验的一次尝试。


## 规范

### 函数头

在每个 `main.mcfunction` 文件的第 0 行都需写入一串 json 配置文本供预处理脚本识别

```mcfunction
# {"Conifg": true}
```

**可写键：**

|Key|Value|Description|
|:---:|:---:|:---:|
|Config|(true\|false)|默认为 ture，当此值为 false 时脚本将跳过处理该函数|
|directive|list|预处理指令标签。可写入：`["@Cache"]`|

### 函数栈

为了实现较好的函数一致性与可读性，PMC 约定至少所有入口函数 (`main.mcfunction` 都应创建独有的函数栈)：`pmc:io stack`

```mcfunction
# ...函数头...

# Push
data modify storage pmc:io stack append value {}

# Main
# 函数体

# Pop
data remove storage pmc:io stack[-1]
```

为实现跨函数通信, 函数栈中约定了几处固有字段

| 固有字段  |        固有子字段        |        描述        |
| :-------: | :----------------------: | :----------------: |
| `CONTEXT` | `args`：用于传递函数参数 | 用于传递函数上下文 |
|  `PARAM`  |            -             |  用于接收函数参数  |

### 函数返回值

PMC 约定了函数执行后结果的存储地址：`pmc:io return`

```mcfunction
# ...other...

# Return
data modify storage pmc:io return set from ...
```

### 异常

PMC 约定了一套异常抛出与捕获语法

```mcfunction
# 添加一个尝试
function #pmc:error.try
    # 抛出一个异常
    function #pmc:error.throw {"args":{"function":"异常函数/函数标签","message":"异常消息文本/文本组件"}}
# 拦截一个异常
execute (if|unless) function #pmc:error.catch run ...
```

### 函数缓存

为了优化频繁调用函数的开销，PMC 引入了简单的缓存与缓存淘汰机制。为了便于使用，缓存函数使用脚本生成的方式，开发者只需向函数头的 `directive` 列表中写入 `"Cache"` 后执行预处理脚本 (main.py) 即可。

**缓存调用：**

```mcfunction
# {"directive": ["@Cache"]}
# ...函数说明...

# Input
...

# Errors
...

# Cache
execute if function <namespace>:<function_path>/cache/main run return run data remove storage pmc:io stack[-1]

# Main
...

# Return
data modify storage pmc:io return set from ...

# Cache
function <namespace>:<function_path>/cache/write/value
```

