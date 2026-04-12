# 缓存比对

data modify storage pmc:io stack[-1].in0 set from storage pmc:io stack[-2].CONTEXT.args
data modify storage pmc:io stack[-1].in1 set from storage pmc:io stack[-2].CONTEXT.args
data modify storage pmc:io stack[-1].in2 set from storage pmc:io stack[-2].CONTEXT.args
data modify storage pmc:io stack[-1].in3 set from storage pmc:io stack[-2].CONTEXT.args
data modify storage pmc:io stack[-1].in4 set from storage pmc:io stack[-2].CONTEXT.args

scoreboard players set #__bool__ pmc.var 1

execute if data storage pmc:io cache."pmc:list".sort[0] store success score #__bool__ pmc.var run data modify storage pmc:io stack[-1].in0 set from storage pmc:io cache."pmc:list".sort[0].key
execute if score #__bool__ pmc.var matches 0 run return 0

execute if data storage pmc:io cache."pmc:list".sort[1] store success score #__bool__ pmc.var run data modify storage pmc:io stack[-1].in1 set from storage pmc:io cache."pmc:list".sort[1].key
execute if score #__bool__ pmc.var matches 0 run return 1

execute if data storage pmc:io cache."pmc:list".sort[2] store success score #__bool__ pmc.var run data modify storage pmc:io stack[-1].in2 set from storage pmc:io cache."pmc:list".sort[2].key
execute if score #__bool__ pmc.var matches 0 run return 2

execute if data storage pmc:io cache."pmc:list".sort[3] store success score #__bool__ pmc.var run data modify storage pmc:io stack[-1].in3 set from storage pmc:io cache."pmc:list".sort[3].key
execute if score #__bool__ pmc.var matches 0 run return 3

execute if data storage pmc:io cache."pmc:list".sort[4] store success score #__bool__ pmc.var run data modify storage pmc:io stack[-1].in4 set from storage pmc:io cache."pmc:list".sort[4].key
execute if score #__bool__ pmc.var matches 0 run return 4

return -1
