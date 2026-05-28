# {"Config": false}
# str.replace(args: {str: str,old: str, new: str, num: int})
# --------------------
# 字符串元素替换
# @Param
# *str: 原始字符串
# *old: 要被替换的子字符串
# *new: 新字符串
# num: 替换次数
# [defult] -> infinity
# --------------------
# 例:
# function #pmc:str.replace {args: {str: "2026/4/7", old: "/", new: "-", num: 2}}
# return: "2026-4-7"
# --------------------

# Input
data modify storage pmc:io stack append value {}
# $data modify storage pmc:io stack[-1].PARAM merge value $(args)
data modify storage pmc:io stack[-1].PARAM merge from storage pmc:io stack[-2].CONTEXT.args

# Errors
function #pmc:error.try
    execute unless data storage pmc:io stack[-1].PARAM.str run \
    function #pmc:error.throw {"args":{"type": "error", "hide": false, "function":"#pmc:str.replace", "message":'缺少必要的参数: "str".'}}
    execute unless data storage pmc:io stack[-1].PARAM.new run \
    function #pmc:error.throw {"args":{"type": "error", "hide": false, "function":"#pmc:str.replace", "message":'缺少必要的参数: "new".'}}
    execute unless data storage pmc:io stack[-1].PARAM.old run \
    function #pmc:error.throw {"args":{"type": "error", "hide": false, "function":"#pmc:str.replace", "message":'缺少必要的参数: "old".'}}
execute if function #pmc:error.catch run return run data remove storage pmc:io stack[-1]

# Cache

# Main
execute unless data storage pmc:io stack[-1].PARAM.num run data modify storage pmc:io stack[-1].PARAM.num set value -1

data modify storage pmc:io stack[-1].CONTEXT.args.str set from storage pmc:io stack[-1].PARAM.str
data modify storage pmc:io stack[-1].CONTEXT.args.sep set from storage pmc:io stack[-1].PARAM.old
data modify storage pmc:io stack[-1].CONTEXT.args.mark set from storage pmc:io stack[-1].PARAM.new
data modify storage pmc:io stack[-1].CONTEXT.args.num set from storage pmc:io stack[-1].PARAM.num
function #pmc:str.split with storage pmc:io stack[-1]
data modify storage pmc:io stack[-1].CONTEXT.args set value {}
data modify storage pmc:io stack[-1].CONTEXT.args.source set from storage pmc:io return
function #pmc:str.strcat with storage pmc:io stack[-1]

# Return
data remove storage pmc:io stack[-1]