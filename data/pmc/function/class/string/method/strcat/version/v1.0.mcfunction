# {"Config": false}
# str.strcat(args: {source: list, sep: list})
# --------------------
# 字符串拼接
# @Param
# *source: 源字符串列表
# sep: 分隔符 (循环插入)
# @Return
# (str): 拼接后的字符串
# --------------------
# 例:
# function #pmc:str.strcat {args: {source: ["归","并","法","拼","接"], sep: ""}}
# return: "归并法拼接"
# --------------------

# Input
data modify storage pmc:io stack append value {}
data modify storage pmc:io stack[-1].PARAM merge from storage pmc:io stack[-2].CONTEXT.args

# Errors
function #pmc:error.try
    execute unless data storage pmc:io stack[-1].PARAM.source run \
    function #pmc:error.throw {"args":{"type": "error", "hide": false, "function":"#pmc:str.strcat", "message":"缺少必要的参数: \"source\"."}}
execute if function #pmc:error.catch run return run data remove storage pmc:io stack[-1]

# Main
execute store result score #__fragNum__ pmc.var run data get storage pmc:io stack[-1].PARAM.source
execute if score #__fragNum__ pmc.var matches ..1 run return run function pmc:class/string/method/strcat_/1.1
    execute if score #__fragNum__ pmc.var matches 0 run \
        data modify storage pmc:io return set value ""
    data modify storage pmc:io return set from storage pmc:io stack[-1].PARAM.source[0]
    data remove storage pmc:io stack[-1]

data modify storage pmc:io stack[-1].result set from storage pmc:io stack[-1].PARAM.source

# sep escape
execute unless data storage pmc:io stack[-1].PARAM.sep run data modify storage pmc:io stack[-1].PARAM merge value {"sep": ""}
data modify storage pmc:io stack[-1].CONTEXT.args.str set from storage pmc:io stack[-1].PARAM.sep
function #pmc:str.escape
data modify storage pmc:io stack[-1].sep set from storage pmc:io return

function pmc:class/string/method/strcat_/1.2
    # loop condition
    execute unless score #__fragNum__ pmc.var matches 2.. run return 1

    # state inheritance
    data modify storage pmc:io stack[-1].copy set from storage pmc:io stack[-1].result
    data modify storage pmc:io stack[-1].result set value []

    # state var
    scoreboard players operation #__groupNum__ pmc.var = #__fragNum__ pmc.var
    scoreboard players operation #__mod__ pmc.var = #__fragNum__ pmc.var

    scoreboard players operation #__groupNum__ pmc.var /= #2 pmc.const
    scoreboard players operation #__mod__ pmc.var %= #2 pmc.const
    scoreboard players operation #__fragNum__ pmc.var -= #__groupNum__ pmc.var

    function pmc:class/string/method/strcat_/1.2.1
        # loop condition
        execute unless score #__groupNum__ pmc.var matches 1.. run return 1
        scoreboard players remove #__groupNum__ pmc.var 1
        # escape & macro cat
        data modify storage pmc:io stack[-1].CONTEXT.args.str set from storage pmc:io stack[-1].copy[0]
        function #pmc:str.escape
        data modify storage pmc:io stack[-1].left set from storage pmc:io return
        data modify storage pmc:io stack[-1].CONTEXT.args.str set from storage pmc:io stack[-1].copy[1]
        function #pmc:str.escape
        data modify storage pmc:io stack[-1].right set from storage pmc:io return
        function pmc:class/string/method/strcat_/1.2.1.1 with storage pmc:io stack[-1]
            $data modify storage pmc:io stack[-1].result append value "$(left)$(sep)$(right)"
        data remove storage pmc:io stack[-1].copy[0]
        data remove storage pmc:io stack[-1].copy[0]
        # loop
        function pmc:class/string/method/strcat_/1.2.1
    # add rem
    execute if score #__mod__ pmc.var matches 1 run \
        data modify storage pmc:io stack[-1].result append from storage pmc:io stack[-1].copy[0]
    # loop
    function pmc:class/string/method/strcat_/1.2

# Return
data modify storage pmc:io return set from storage pmc:io stack[-1].result[0]
data remove storage pmc:io stack[-1]