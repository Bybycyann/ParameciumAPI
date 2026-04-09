# list.split(args: {source: list, range: list})
# --------------------
# 依据分隔符切片
# @Param
# *source: 原始列表
# *range: 范围 [start, end)
# @Return
# (list): 切片后获得的列表
# --------------------
# 例:
# function #pmc:list.split {args: {source: ["aaa","bb","123","nyahahaha","tmp"], range: [1,4]}}
# return: ["bb","123","nyahahaha"]
# --------------------

# Input
data modify storage pmc:io stack append value {}
$data modify storage pmc:io stack[-1].PARAM merge value $(args)
# data modify storage pmc:io stack[-1].PARAM set from storage pmc:io stack[-2].CONTEXT.args
execute store result score #__len__ pmc.var run data get storage pmc:io stack[-1].PARAM.source
execute store result score #__a__ pmc.var run data get storage pmc:io stack[-1].PARAM.range[0]
execute store result score #__b__ pmc.var run data get storage pmc:io stack[-1].PARAM.range[1]
execute if score #__b__ pmc.var matches ..-1 run scoreboard players operation #__b__ pmc.var += #__len__ pmc.var
data modify storage pmc:io return set value []

# Errors
function #pmc:error.try
    execute unless data storage pmc:io stack[-1].PARAM.source run \
    function #pmc:error.throw {"args":{"type": "error", "function":"#pmc:list.split", "message":'缺少必要的参数: "source".'}}
    function #pmc:error.try
        execute unless data storage pmc:io stack[-1].PARAM.range run \
            function #pmc:error.throw {"args":{"type": "error", "function":"#pmc:list.split", "message":'缺少必要的参数: "range".'}}
    execute unless function #pmc:error.catch if function pmc:class/list/method/split/predicate/1 run \
        function #pmc:error.throw {"args":{"type": "error", "function":"#pmc:list.split", "message":{"translate": '意外的 "%s" 出现在 range.', "with": [{"type": "nbt", "storage": "pmc:io", "nbt": "stack[-1].PARAM.range"}]}}}
execute if function #pmc:error.catch run return run data remove storage pmc:io stack[-1]

# Cache

# Main
# 更新指针
function pmc:class/list/method/split/1.1
# 截取
function pmc:class/list/method/split/1.2

# Return
data remove storage pmc:io stack[-1]
