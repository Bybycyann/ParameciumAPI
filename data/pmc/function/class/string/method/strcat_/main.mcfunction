# {"Config": false}
# str.strcat(args: {source: list, sep: list})
# --------------------
# 字符串拼接
# @Param
# *source: 源字符串列表
# sep: 分隔符 (循环插入)
# @Return
# (str): 拼接后的字符串
# --------------------
# 例:
# function #pmc:str.strcat {args: {source: ["你","好","呀","~"], sep: " "}}
# return: "你 好 呀 ~"
# --------------------

# Input
data modify storage pmc:io stack append value {}
data modify storage pmc:io stack[-1].PARAM merge from storage pmc:io stack[-2].CONTEXT.args

# Errors
function #pmc:error.try
    execute unless data storage pmc:io stack[-1].PARAM.source run \
    function #pmc:error.throw {"args":{"type": "error", "hide": false, "function":"#pmc:str.strcat", "message":"缺少必要的参数: \"source\"."}}
execute if function #pmc:error.catch run return run data remove storage pmc:io stack[-1]

# Main
execute store result score #__fragNum__ pmc.var run data get storage pmc:io stack[-1].PARAM.source
execute if score #__fragNum__ pmc.var matches ..1 run return run function pmc:class/string/method/strcat_/1.1

data modify storage pmc:io stack[-1].result set from storage pmc:io stack[-1].PARAM.source

# sep escape
execute unless data storage pmc:io stack[-1].PARAM.sep run data modify storage pmc:io stack[-1].PARAM merge value {"sep": ""}
data modify storage pmc:io stack[-1].CONTEXT.args.str set from storage pmc:io stack[-1].PARAM.sep
function #pmc:str.escape
data modify storage pmc:io stack[-1].sep set from storage pmc:io return

function pmc:class/string/method/strcat_/1.2

# Return
data modify storage pmc:io return set from storage pmc:io stack[-1].result[0]
data remove storage pmc:io stack[-1]