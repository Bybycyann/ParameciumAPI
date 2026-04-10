# 排序

# left
execute if predicate {"condition": "minecraft:value_check", "value": {"type": "minecraft:storage", "storage": "pmc:io", "path": "stack[-1].PARAM.left[0]"}, "range": {"max": {"type": "minecraft:storage", "storage": "pmc:io", "path": "stack[-1].PARAM.right[0]"}}} run return run function pmc:class/list/method/sort/mergesort/merge/1.1.1.1
#right
data modify storage pmc:io stack[-1].result append from storage pmc:io stack[-1].PARAM.right[0]
data remove storage pmc:io stack[-1].PARAM.right[0]
scoreboard players add #__r__ pmc.var 1
