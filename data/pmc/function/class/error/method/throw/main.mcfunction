# {"Config": false}
# error.throw(args: {type: str, function: str, message: str/textComponent, hide: bool})
# --------------------
# 抛出异常
# @Param
# type: 异常类型
# [defult] -> error
# *function: 异常函数
# *message: 异常消息
# hide: 是否隐藏异常消息
# [defult] -> false
# @Update
# Error stack(error)
# --------------------

execute if score #__error__ pmc.var matches ..-1 run return run scoreboard players set #__error__ pmc.var -1

# Input
data modify storage pmc:io stack append value {}
$data modify storage pmc:io stack[-1].PARAM set value $(args)

# 构建异常消息
data modify storage pmc:io stack[-1].CONTEXT.args.str set from storage pmc:io stack[-1].PARAM.function
data modify storage pmc:io stack[-1].CONTEXT.args merge value {old: "#", new: "", num: 1}
function #pmc:str.replace

data modify storage pmc:io stack[-1].CONTEXT.args set value {}
data modify storage pmc:io stack[-1].CONTEXT.args.str set from storage pmc:io return
data modify storage pmc:io stack[-1].CONTEXT.args merge value {sep: ":", num: 1}
function #pmc:str.split

data modify storage pmc:io stack[-1].error.namespace set from storage pmc:io return[0]
data modify storage pmc:io stack[-1].error merge from storage pmc:io stack[-1].PARAM
execute unless data storage pmc:io stack[-1].PARAM.type run data modify storage pmc:io stack[-1].error.type set value "error"

# Return
# 压入异常栈帧
data modify storage pmc:io error[-1] append from storage pmc:io stack[-1].error
data remove storage pmc:io stack[-1]
