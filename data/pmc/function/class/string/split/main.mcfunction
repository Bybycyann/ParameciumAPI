# str.split(args: {str: str,sep: str, mark: str, num: int})
# --------------------
# 依据分隔符切片
# @Param
# *str: 原始字符串
# sep: 分隔符
# [defult] -> ' '
# mark: 分隔符标记
# [defult] -> Null
# num: 切片的最大次数
# [defult] -> infinity
# @Return
# (list): 切片后的字符串列表
# --------------------
# 例:
# function #pmc:str.split {args: {str: "a:b:c:d:e:f:g", sep: ":", mark: "@",num: 3}}
# return: ["a","@","b","@","c","@","d:e:f:g"]
# --------------------

# Input
data modify storage pmc:io stack append value {}
$data modify storage pmc:io stack[-1].PARAM merge value $(args)

# Errors
function #pmc:error.try
    execute unless data storage pmc:io stack[-1].PARAM.str run \
    function #pmc:error.throw {"args":{"type": "error", "function":"#pmc:str.split", "message":'缺少必要的参数: "str".'}}
execute if function #pmc:error.catch run return run data remove storage pmc:io stack[-1]

# Cache

# Main
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

# Return
data modify storage pmc:io return set from storage pmc:io stack[-1].hach_sep
data remove storage pmc:io stack[-1]
