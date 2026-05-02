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
# function #pmc:str.strcat {args: {source: ['2026','4','7',''], sep: ['年','月','日']}}
# return: "2026年4月7日"
# --------------------

# Input
data modify storage pmc:io stack append value {}
# $data modify storage pmc:io stack[-1].PARAM merge value $(args)
data modify storage pmc:io stack[-1].PARAM set from storage pmc:io stack[-2].CONTEXT.args

# Errors
function #pmc:error.try
    execute unless data storage pmc:io stack[-1].PARAM.source run \
    function #pmc:error.throw {"args":{"type": "error", "hide": false, "function":"#pmc:str.strcat", "message":'缺少必要的参数: "source".'}}
execute if function #pmc:error.catch run return run data remove storage pmc:io stack[-1]

# Cache

# Main
execute unless data storage pmc:io stack[-1].PARAM.sep run data modify storage pmc:io stack[-1].PARAM merge value {sep: ['']}
execute store result score #__i__ pmc.var run data get storage pmc:io stack[-1].PARAM.source
execute store result score #__len__ pmc.var run data get storage pmc:io stack[-1].PARAM.sep
function pmc:class/string/strcat/1.1

# Return
data modify storage pmc:io return set from storage pmc:io stack[-1].strcat
data remove storage pmc:io stack[-1]
