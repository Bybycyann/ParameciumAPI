# 缓存

data modify storage pmc:io stack append value {}
data modify storage pmc:io stack[-1].copy set from storage pmc:io stack[-2].CONTEXT.args
execute store result score #__index__ pmc.var run function pmc:class/list/method/sort/cache/compare
# 缓存未命中
execute if score #__index__ pmc.var matches -1 run return run function pmc:class/list/method/sort/cache/write/key
# 缓存命中
function pmc:class/list/method/sort/cache/update/main

data remove storage pmc:io stack[-1]
return 1
