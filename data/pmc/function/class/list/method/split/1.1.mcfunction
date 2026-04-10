# 丢弃片段

execute if score #__a__ pmc.var matches ..0 run return 1
scoreboard players remove #__a__ pmc.var 1

data remove storage pmc:io stack[-1].PARAM.source[0]
scoreboard players remove #__b__ pmc.var 1

function pmc:class/list/method/split/1.1
