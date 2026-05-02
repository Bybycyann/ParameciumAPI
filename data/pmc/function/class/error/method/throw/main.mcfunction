# {"Config": false}
# error.throw(args: {type: str, hide: bool, tag: str,function: str, message: str/textComponent})
# --------------------
# 抛出异常
# @Param
# type: 异常类型
# [defult] -> warning
# *function: 异常函数
# *message: 异常消息
# hide: 是否隐藏异常消息
# [defult] -> true
# tag: 异常标签 (⚠️允许的字符包括：-、+、.、_、A-Z、a-z、0-9)
# [defult] -> None
# @Update
# Error stack(error)
# --------------------

execute if score #__error__ pmc.var matches ..-1 run return run scoreboard players set #__error__ pmc.var -1

# Input
data modify storage pmc:io stack append value {}
data modify storage pmc:io stack[-1].PARAM set value {"type": "warning", "hide": true, "tag": "#None"}
$data modify storage pmc:io stack[-1].PARAM merge value $(args)

# 构建异常对象 {type,function,message,namespace,tag}
data modify storage pmc:io stack[-1].error merge from storage pmc:io stack[-1].PARAM
# 解析命名空间
execute if data storage pmc:io stack[-1].PARAM{"hide": false} run function pmc:class/error/method/throw/1.1

# Return
# 压入异常栈帧
data modify storage pmc:io error[-1] append from storage pmc:io stack[-1].error
data remove storage pmc:io stack[-1]
