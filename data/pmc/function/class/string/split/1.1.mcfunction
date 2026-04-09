# 字符串切片

execute if score #__i__ pmc.var matches ..0 run return run function pmc:class/string/split/1.1.3 with storage pmc:io stack[-1]
scoreboard players remove #__i__ pmc.var 1

function pmc:class/string/split/1.1.1 with storage pmc:io stack[-1]
execute store success score #__bool__ pmc.var run data modify storage pmc:io stack[-1].str_tmp set from storage pmc:io stack[-1].PARAM.sep
execute if score #__bool__ pmc.var matches 0 run function pmc:class/string/split/1.1.2 with storage pmc:io stack[-1]

execute unless score #__update__ pmc.var matches 1 run scoreboard players operation #__index__ pmc.var -= #__len-1__ pmc.var
scoreboard players set #__update__ pmc.var 0
execute store result storage pmc:io stack[-1].start int 1 run scoreboard players get #__start__ pmc.var
execute store result storage pmc:io stack[-1].index0 int 1 run scoreboard players get #__index__ pmc.var
execute store result storage pmc:io stack[-1].index1 int 1 run scoreboard players operation #__index__ pmc.var += #__len__ pmc.var

function pmc:class/string/split/1.1
