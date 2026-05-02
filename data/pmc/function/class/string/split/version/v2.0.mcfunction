# Input
data modify storage pmc:io stack append value {}
data modify storage pmc:io stack[-1].PARAM merge value {"sep": " ","mark": "#None", "num": 2147483647}
data modify storage pmc:io stack[-1].PARAM merge from storage pmc:io stack[-2].CONTEXT.args

# Error
function #pmc:error.try
    execute unless data storage pmc:io stack[-1].PARAM.str run \
    function #pmc:error.throw {"args":{"type": "error", "function":"#pmc:str.split", "message":'缺少必要的参数: "str".'}}
execute if function #pmc:error.catch run return run data remove storage pmc:io stack[-1]

# Main
data modify storage pmc:io stack[-1] merge value {"RESULT": []}
execute store result score #__strLen__ pmc.var run data get storage pmc:io stack[-1].PARAM.str
execute store result score #__sepLen__ pmc.var store result storage pmc:io stack[-1].sepLen int 1 run data get storage pmc:io stack[-1].PARAM.sep
execute store result score #__splitNum__ pmc.var run data get storage pmc:io stack[-1].PARAM.num
scoreboard players set #__ptr__ pmc.var 0
data modify storage pmc:io stack[-1].strC set from storage pmc:io stack[-1].PARAM.str
# 切片函数
function pmc:class/string/split_new/1.1
    execute unless function pmc:class/string/split_new/predicate/loop_conditions run return 1
    function pmc:class/string/split_new/1.1.1 with storage pmc:io stack[-1]
        $data modify storage pmc:io stack[-1].frag set string storage pmc:io stack[-1].strC 0 $(sepLen)
    execute unless function pmc:class/string/split_new/predicate/frag_contrast run return run function pmc:class/string/split_new/1.1.2
        scoreboard players remove #__splitNum__ pmc.var 1
        scoreboard players operation #__strLen__ pmc.var -= #__sepLen__ pmc.var
        execute store result storage pmc:io stack[-1].ptr0 int 1 run scoreboard players get #__ptr__ pmc.var
        execute store result storage pmc:io stack[-1].ptr int 1 run scoreboard players operation #__ptr__ pmc.var += #__sepLen__ pmc.var
        function pmc:class/string/split_new/1.1.2.1 with storage pmc:io stack[-1]
            $data modify storage pmc:io stack[-1].RESULT append string storage pmc:io stack[-1].PARAM.str 0 $(ptr0)
            $data modify storage pmc:io stack[-1].PARAM.str set string storage pmc:io stack[-1].PARAM.str $(ptr)
        scoreboard players set #__ptr__ pmc.var 0
        data modify storage pmc:io stack[-1].strC set from storage pmc:io stack[-1].PARAM.str
        execute unless data storage pmc:io stack[-1].PARAM{"mark": "#None"} run \
            data modify storage pmc:io stack[-1].RESULT append from storage pmc:io stack[-1].PARAM.mark
        function pmc:class/string/split_new/1.1
    scoreboard players remove #__strLen__ pmc.var 1
    scoreboard players add #__ptr__ pmc.var 1
    data modify storage pmc:io stack[-1].strC set string storage pmc:io stack[-1].strC 1
    function pmc:class/string/split_new/1.1
# 末尾元素
data modify storage pmc:io stack[-1].RESULT append from storage pmc:io stack[-1].PARAM.str

# Return
data modify storage pmc:io return set from storage pmc:io stack[-1].RESULT
data remove storage pmc:io stack[-1]


