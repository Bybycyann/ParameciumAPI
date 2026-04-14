# {"Config": false}
# merge(left, right)
# --------------------
# 归并排序-合并
# @Paramr:
# left: 左数组
# right: 右数组
# @Return:
# (list): 合并后的列表
# --------------------

# Input
data modify storage pmc:io stack append value {}
data modify storage pmc:io stack[-1].PARAM set from storage pmc:io stack[-2].CONTEXT.args

# Main
execute store result score #__llen__ pmc.var run data get storage pmc:io stack[-1].PARAM.left
execute store result score #__rlen__ pmc.var run data get storage pmc:io stack[-1].PARAM.right
execute store result score #__r__ pmc.var run scoreboard players set #__l__ pmc.var 0

function pmc:class/list/method/sort/mergesort/merge/1.1

execute if data storage pmc:io stack[-1].PARAM.left[0] run data modify storage pmc:io stack[-1].result append from storage pmc:io stack[-1].PARAM.left[]
execute if data storage pmc:io stack[-1].PARAM.right[0] run data modify storage pmc:io stack[-1].result append from storage pmc:io stack[-1].PARAM.right[]

# Return
data modify storage pmc:io return set from storage pmc:io stack[-1].result
data remove storage pmc:io stack[-1]