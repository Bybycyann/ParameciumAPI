# 截取

execute if score #__b__ pmc.var matches ..0 run return 1
scoreboard players remove #__b__ pmc.var 1

data modify storage pmc:io return append from storage pmc:io stack[-1].PARAM.source[0]
data remove storage pmc:io stack[-1].PARAM.source[0]

function pmc:class/list/method/split/1.2
