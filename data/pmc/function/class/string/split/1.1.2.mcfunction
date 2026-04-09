# 字符串切片

scoreboard players set #__update__ pmc.var 1

$data modify storage pmc:io return append string storage pmc:io stack[-1].PARAM.str $(start) $(index0)
execute if data storage pmc:io stack[-1].PARAM.mark run data modify storage pmc:io return append from storage pmc:io stack[-1].PARAM.mark
execute store result score #__start__ pmc.var store result score #__index__ pmc.var run data get storage pmc:io stack[-1].index1

scoreboard players operation #__i__ pmc.var -= #__len-1__ pmc.var
scoreboard players remove #__num__ pmc.var 1
execute unless score #__num__ pmc.var matches 0 run return 0
scoreboard players set #__i__ pmc.var 0
