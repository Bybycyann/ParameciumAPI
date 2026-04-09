# merge_store(arr)
# --------------------
# 归并排序
# @Paramr:
# arr: 待排序的列表
# @Return:
# (list): 排序后的新列表
# --------------------

# Input
data modify storage pmc:io stack append value {}
data modify storage pmc:io stack[-1].PARAM set from storage pmc:io stack[-2].CONTEXT.args

# Errors
function #pmc:error.try
    execute unless data storage pmc:io stack[-1].PARAM.arr run \
    function #pmc:error.throw {"args":{"type": "error", "function":"#pmc:list.mergestore", "message":'缺少必要的参数: "arr".'}}
execute if function #pmc:error.catch run return run data remove storage pmc:io stack[-1]

# Cache

# Main
execute store result score #__i__ pmc.var run data get storage pmc:io stack[-1].PARAM.arr
scoreboard players operation #__i__ pmc.var /= #2 pmc.const

# Return
data modify storage pmc:io return set from storage pmc:io stack[-1].sorted
data remove storage pmc:io stack[-1]
