# {"Config": false}
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
data modify storage pmc:io stack[-1].PARAM merge value {"sep": " ","mark": "#None", "num": 2147483647}
data modify storage pmc:io stack[-1].PARAM merge from storage pmc:io stack[-2].CONTEXT.args

# Error
function #pmc:error.try
    execute unless data storage pmc:io stack[-1].PARAM.str run \
    function #pmc:error.throw {"args":{"type": "error", "hide": false, "function":"#pmc:str.split", "message":'缺少必要的参数: "str".'}}
execute if function #pmc:error.catch run return run data remove storage pmc:io stack[-1]

# Main
data modify storage pmc:io stack[-1] merge value {"RESULT": []}
execute store result score #__strLen__ pmc.var run data get storage pmc:io stack[-1].PARAM.str
execute store result score #__sepLen__ pmc.var store result storage pmc:io stack[-1].sepLen int 1 run data get storage pmc:io stack[-1].PARAM.sep
execute store result score #__splitNum__ pmc.var run data get storage pmc:io stack[-1].PARAM.num
scoreboard players set #__ptr__ pmc.var 0
data modify storage pmc:io stack[-1].strC set from storage pmc:io stack[-1].PARAM.str
# 切片函数
function pmc:class/string/split/1.1
# 末尾元素
data modify storage pmc:io stack[-1].RESULT append from storage pmc:io stack[-1].PARAM.str

# Return
data modify storage pmc:io return set from storage pmc:io stack[-1].RESULT
data remove storage pmc:io stack[-1]