# 捕获异常

execute if score #__i__ pmc.var matches ..0 run return 1
scoreboard players remove #__i__ pmc.var 1

# Push
data modify storage pmc:io stack append value {}
data modify storage pmc:io stack[-1].error set from storage pmc:io error[-1][-1]

# 打印异常消息
execute if data storage pmc:io stack[-1].error{"hide": false} run function pmc:class/error/method/catch/1.1.1

# Pop
data remove storage pmc:io error[-1][-1]
data remove storage pmc:io stack[-1]

function pmc:class/error/method/catch/1.1
