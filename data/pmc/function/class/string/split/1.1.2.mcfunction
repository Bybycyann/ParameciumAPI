scoreboard players remove #__splitNum__ pmc.var 1
scoreboard players operation #__strLen__ pmc.var -= #__sepLen__ pmc.var
execute store result storage pmc:io stack[-1].ptr0 int 1 run scoreboard players get #__ptr__ pmc.var
execute store result storage pmc:io stack[-1].ptr int 1 run scoreboard players operation #__ptr__ pmc.var += #__sepLen__ pmc.var
function pmc:class/string/split/1.1.2.1 with storage pmc:io stack[-1]
scoreboard players set #__ptr__ pmc.var 0
data modify storage pmc:io stack[-1].strC set from storage pmc:io stack[-1].PARAM.str
execute unless data storage pmc:io stack[-1].PARAM{"mark": "#None"} run data modify storage pmc:io stack[-1].RESULT append from storage pmc:io stack[-1].PARAM.mark
function pmc:class/string/split/1.1
