# 字符串拼接

execute if score #__i__ pmc.var matches ..1 run return run function pmc:class/string/strcat/1.1.3
scoreboard players remove #__i__ pmc.var 1

# sep loop
data modify storage pmc:io stack[-1].g.sep set from storage pmc:io stack[-1].PARAM.sep[0]
execute if score #__len__ pmc.var matches 2.. run function pmc:class/string/strcat/1.1.2

data modify storage pmc:io stack[-1].str_tmp.a set from storage pmc:io stack[-1].PARAM.source[0]
data modify entity 504D43-44-0-0-1 text set value {storage: "pmc:io", nbt: "stack[-1].str_tmp"}
data modify storage pmc:io stack[-1].g.str1 set string entity 504D43-44-0-0-1 text 4 -2
data modify storage pmc:io stack[-1].str_tmp.a set from storage pmc:io stack[-1].PARAM.source[1]
data modify entity 504D43-44-0-0-1 text set value {storage: "pmc:io", nbt: "stack[-1].str_tmp"}
data modify storage pmc:io stack[-1].g.str2 set string entity 504D43-44-0-0-1 text 4 -2

function pmc:class/string/strcat/1.1.1
data remove storage pmc:io stack[-1].PARAM.source[0]

function pmc:class/string/strcat/1.1
