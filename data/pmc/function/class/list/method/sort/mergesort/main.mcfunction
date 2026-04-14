# {"Config": false}
# list.mergestore(arr)
# --------------------
# 归并排序
# @Paramr:
# *arr: 待排序的列表
# @Return:
# (list): 排序后的新列表
# --------------------

# Input
data modify storage pmc:io stack append value {}
data modify storage pmc:io stack[-1].PARAM set from storage pmc:io stack[-2].CONTEXT.args

# Main
execute store result score #__len__ pmc.var run data get storage pmc:io stack[-1].PARAM.arr

execute if score #__len__ pmc.var matches ..1 run return run function pmc:class/list/method/sort/mergesort/1.1

scoreboard players operation #__len__ pmc.var /= #2 pmc.const
function pmc:class/list/method/sort/mergesort/1.2

data modify storage pmc:io stack[-1].CONTEXT.args set value {}

data modify storage pmc:io stack[-1].CONTEXT.args.arr set from storage pmc:io stack[-1].arrArg
function pmc:class/list/method/sort/mergesort/main
data modify storage pmc:io stack[-1].merge.left set from storage pmc:io return

data modify storage pmc:io stack[-1].CONTEXT.args.arr set from storage pmc:io stack[-1].PARAM.arr
function pmc:class/list/method/sort/mergesort/main
data modify storage pmc:io stack[-1].merge.right set from storage pmc:io return

data modify storage pmc:io stack[-1].CONTEXT.args set value {}
data modify storage pmc:io stack[-1].CONTEXT.args merge from storage pmc:io stack[-1].merge
function pmc:class/list/method/sort/mergesort/merge/main

# Return
data remove storage pmc:io stack[-1]
