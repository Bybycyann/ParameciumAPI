# {"Config": false}
# str.escape(args: {str: str})
# --------------------
# 向标准字符串添加转义
# @Param
# *str: 原始字符串
# @Return
# (str): 添加一层转义后的字符串
# --------------------
# 例:
# function #pmc:str.strcat {args: {str: "\"test\"\\\\"}}
# return: '"test"\\\\\\\\'
# --------------------

# Input
data modify storage pmc:io stack append value {}
data modify storage pmc:io stack[-1].PARAM merge from storage pmc:io stack[-2].CONTEXT.args

# Errors
function #pmc:error.try
    execute unless data storage pmc:io stack[-1].PARAM.str run \
    function #pmc:error.throw {"args":{"type": "error", "hide": false, "function":"#pmc:str.escape", "message":"str: 期待接收一个字符串."}}
execute if function #pmc:error.catch run return run data remove storage pmc:io stack[-1]

# Main
data modify storage pmc:io stack[-1].str.a set from storage pmc:io stack[-1].PARAM.str
data modify entity 504D43-44-0-0-1 text set value {storage: "pmc:io", nbt: "stack[-1].str"}

# Return
data modify storage pmc:io return set from entity 504D43-44-0-0-1 text.extra[-3].text
data remove storage pmc:io stack[-1]
