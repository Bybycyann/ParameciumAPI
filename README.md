# ParameciumAPI

> 在纯 Datapack 基础上优化 mcfunction 开发体验的一次尝试。


## 规范

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