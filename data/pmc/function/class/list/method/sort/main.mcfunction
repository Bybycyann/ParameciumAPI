# list.sort(arr: list, method: (mergesort|...))
# --------------------
# 列表排序
# @Paramr:
# *arr: 待排序的列表
# method: 子算法
# [defult] -> 'mergesort'
# @Return:
# (list): 排序后的新列表
# --------------------

# Input
data modify storage pmc:io stack append value {}
data modify storage pmc:io stack[-1].CONTEXT.args merge from storage pmc:io stack[-2].CONTEXT.args

# Errors
function #pmc:error.try
    execute unless data storage pmc:io stack[-1].CONTEXT.args.arr run \
    function #pmc:error.throw {"args":{"type": "error", "function":"#pmc:list.mergestore", "message":'缺少必要的参数: "arr".'}}
execute if function #pmc:error.catch run return run data remove storage pmc:io stack[-1]

# Cache
execute if function pmc:class/list/method/sort/cache/main run return run data remove storage pmc:io stack[-1]

# Main
execute unless data storage pmc:io stack[-1].CONTEXT.args.method run data modify storage pmc:io stack[-1].PARAM.method set value "mergesort"

execute if data storage pmc:io stack[-1].PARAM{method:"mergesort"} run function pmc:class/list/method/sort/mergesort/main

# Return
data remove storage pmc:io stack[-1]

# Cache
execute if data storage pmc:io cache."pmc:list".sort[{value: "#Cache#"}] run data modify storage pmc:io cache."pmc:list".sort[0].value set from storage pmc:io return
