function pmc:class/list/method/sort/mergesort/merge/predicate/1:
    execute if score #__l__ pmc.var < #__llen__ pmc.var if score #__r__ pmc.var < #__rlen__ pmc.var run return 1
    return 0

# Input
data modify storage pmc:io stack append value {}
$data modify storage pmc:io stack[-1].PARAM set value $(args)
# data modify storage pmc:io stack[-1].PARAM set from storage pmc:io stack[-2].CONTEXT.args

# Cache

# Main
execute store result score #__len__ pmc.var run data get storage pmc:io stack[-1].PARAM.arr

execute if score #__len__ pmc.var matches ..1 run return run function pmc:class/list/method/sort/mergesort/1.1:
    data modify storage pmc:io return set from storage pmc:io stack[-1].PARAM.arr
    data remove storage pmc:io stack[-1]

scoreboard players operation #__len__ pmc.var /= #2 pmc.const
function pmc:class/list/method/sort/mergesort/1.2:
    execute if score #__len__ pmc.var matches ..0 run return 1
    scoreboard players remove #__len__ pmc.var 1
    data modify storage pmc:io stack[-1].arrArg append from storage pmc:io stack[-1].PARAM.arr[0]
    data remove storage pmc:io stack[-1].PARAM.arr[0]
    function pmc:class/list/method/sort/mergesort/1.2

data modify storage pmc:io stack[-1].CONTEXT.args set value {}
data modify storage pmc:io stack[-1].CONTEXT.args.arr set from storage pmc:io stack[-1].arrArg
function pmc:class/list/method/sort/mergesort/main
data modify storage pmc:io stack[-1].merge.left set from storage pmc:io return

data modify storage pmc:io stack[-1].CONTEXT.args.arr set from storage pmc:io stack[-1].PARAM.arr
function pmc:class/list/method/sort/mergesort/main
data modify storage pmc:io stack[-1].merge.right set from storage pmc:io return

data modify storage pmc:io stack[-1].CONTEXT.args set value {}
data modify storage pmc:io stack[-1].CONTEXT.args merge from storage pmc:io stack[-1].merge
function pmc:class/list/method/sort/mergesort/merge/main:
    # Input
    data modify storage pmc:io stack append value {}
    data modify storage pmc:io stack[-1].PARAM set from storage pmc:io stack[-2].CONTEXT.args

    # Main
    execute store result score #__llen__ pmc.var run data get storage pmc:io stack[-1].PARAM.left
    execute store result score #__rlen__ pmc.var run data get storage pmc:io stack[-1].PARAM.right
    execute store result score #__r__ pmc.var run scoreboard players set #__l__ pmc.var 0
    function pmc:class/list/method/sort/mergesort/merge/1.1:
        execute unless function pmc:class/list/method/sort/mergesort/merge/predicate/1 run return 1

        function pmc:class/list/method/sort/mergesort/merge/1.1.1:
            execute if predicate {"condition": "minecraft:value_check", "value": {"type": "minecraft:storage", "storage": "pmc:io", "path": "stack[-1].PARAM.left[0]"}, "range": {"max": {"type": "minecraft:storage", "storage": "pmc:io", "path": "stack[-1].PARAM.right[0]"}}} run return run function pmc:class/list/method/sort/mergesort/merge/1.1.1.1:
                data modify storage pmc:io stack[-1].result append from storage pmc:io stack[-1].PARAM.left[0]
                data remove storage pmc:io stack[-1].PARAM.left[0]
                scoreboard players add #__l__ pmc.var 1

            data modify storage pmc:io stack[-1].result append from storage pmc:io stack[-1].PARAM.right[0]
            data remove storage pmc:io stack[-1].PARAM.right[0]
            scoreboard players add #__r__ pmc.var 1
        
        function pmc:class/list/method/sort/mergesort/merge/1.1
    data modify storage pmc:io stack[-1].result append from storage pmc:io stack[-1].PARAM.left[]
    data modify storage pmc:io stack[-1].result append from storage pmc:io stack[-1].PARAM.right[]

    # Return
    data modify storage pmc:io return set from storage pmc:io stack[-1].result
    data remove storage pmc:io stack[-1]

# Return
data remove storage pmc:io stack[-1]