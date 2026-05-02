# Input
data modify storage pmc:io stack append value {}
data modify storage pmc:io stack[-1].PARAM set from storage pmc:io stack[-2].CONTEXT.args

# Error
function #pmc:error.try
    execute unless data storage pmc:io stack[-1].PARAM.str run \
    function #pmc:error.throw {"args":{"type": "error", "function":"#pmc:str.split", "message":'缺少必要的参数: "str".'}}
execute if function #pmc:error.catch run return run data remove storage pmc:io stack[-1]

# return = []
# if stack[-1]['PARAM']['sep'] == None: stack[-1]['PARAM']['sep'] = ''
# i = len(stack[-1]['PARAM']['sep'])
# 
data modify storage pmc:io return set value []
execute unless data storage pmc:io stack[-1].PARAM.sep run data modify storage pmc:io stack[-1].PARAM.sep set value ' '

execute store result score #__i__ pmc.var run data get storage pmc:io stack[-1].PARAM.str
execute store result score #__len-1__ pmc.var store result score #__len__ pmc.var run data get storage pmc:io stack[-1].PARAM.sep
scoreboard players remove #__len-1__ pmc.var 1
scoreboard players operation #__i__ pmc.var -= #__len-1__ pmc.var
execute store result score #__num__ pmc.var run data get storage pmc:io stack[-1].PARAM.num
scoreboard players set #__index__ pmc.var 0
scoreboard players set #__start__ pmc.var 0
execute store result storage pmc:io stack[-1].start int 1 run scoreboard players get #__start__ pmc.var
execute store result storage pmc:io stack[-1].index0 int 1 run scoreboard players get #__index__ pmc.var
execute store result storage pmc:io stack[-1].index1 int 1 run scoreboard players operation #__index__ pmc.var += #__len__ pmc.var

function pmc:class/string/split/1.1
    execute if score #__i__ pmc.var matches ..0 run return run function pmc:class/string/split/1.1.3 with storage pmc:io stack[-1]
        $data modify storage pmc:io return append string storage pmc:io stack[-1].PARAM.str $(start)
    scoreboard players remove #__i__ pmc.var 1
    function pmc:class/string/split/1.1.1 with storage pmc:io stack[-1]
        $data modify storage pmc:io stack[-1].str_tmp set string storage pmc:io stack[-1].PARAM.str $(index0) $(index1)
    execute store success score #__bool__ pmc.var run data modify storage pmc:io stack[-1].str_tmp set from storage pmc:io stack[-1].PARAM.sep
    execute if score #__bool__ pmc.var matches 0 run function pmc:class/string/split/1.1.2 with storage pmc:io stack[-1]
        scoreboard players set #__update__ pmc.var 1
        $data modify storage pmc:io return append string storage pmc:io stack[-1].PARAM.str $(start) $(index0)
        execute if data storage pmc:io stack[-1].PARAM.mark run data modify storage pmc:io return append from storage pmc:io stack[-1].PARAM.mark
        execute store result score #__start__ pmc.var store result score #__index__ pmc.var run data get storage pmc:io stack[-1].index1
        scoreboard players operation #__i__ pmc.var -= #__len-1__ pmc.var
        scoreboard players remove #__num__ pmc.var 1
        execute unless score #__num__ pmc.var matches 0 run return 0
        scoreboard players set #__i__ pmc.var 0
    execute unless score #__update__ pmc.var matches 1 run scoreboard players operation #__index__ pmc.var -= #__len-1__ pmc.var
    scoreboard players set #__update__ pmc.var 0
    execute store result storage pmc:io stack[-1].start int 1 run scoreboard players get #__start__ pmc.var
    execute store result storage pmc:io stack[-1].index0 int 1 run scoreboard players get #__index__ pmc.var
    execute store result storage pmc:io stack[-1].index1 int 1 run scoreboard players operation #__index__ pmc.var += #__len__ pmc.var
    function pmc:class/string/split/1.1
data modify storage pmc:io return set from storage pmc:io stack[-1].hach_sep
data remove storage pmc:io stack[-1]
