# 捕获异常

execute if score #__i__ pmc.var matches ..0 run return 0
scoreboard players remove #__i__ pmc.var 1

# 打印异常消息
execute store result score #__bool__ pmc.var run data get storage pmc:io error[-1][-1].hide
execute if score #__bool__ pmc.var matches 0 run function pmc:class/error/method/catch/1.1.1

# 弹出栈帧
data remove storage pmc:io error[-1][-1]

function pmc:class/error/method/catch/1.1
