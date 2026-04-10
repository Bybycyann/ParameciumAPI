# 拆分数组

execute if score #__len__ pmc.var matches ..0 run return 1
scoreboard players remove #__len__ pmc.var 1
data modify storage pmc:io stack[-1].arrArg append from storage pmc:io stack[-1].PARAM.arr[0]
data remove storage pmc:io stack[-1].PARAM.arr[0]
function pmc:class/list/method/sort/mergesort/1.2
