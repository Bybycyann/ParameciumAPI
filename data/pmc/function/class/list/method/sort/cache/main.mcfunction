# {"Config": false}
# Function Cache - (Script)
data modify storage pmc:io stack append value {}
data modify storage pmc:io stack[-1].copy set from storage pmc:io stack[-2].CONTEXT.args
execute store result score #__index__ pmc.var run function pmc:class/list/method/sort/cache/compare
execute if score #__index__ pmc.var matches -1 run return run function pmc:class/list/method/sort/cache/write/key
function pmc:class/list/method/sort/cache/update/main
data remove storage pmc:io stack[-1]
return 1
