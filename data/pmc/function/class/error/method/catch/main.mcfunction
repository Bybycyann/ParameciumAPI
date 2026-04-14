# {"Config": false}
# error.catch()
# --------------------
# 拦截一个异常
# --------------------

execute if score #__error__ pmc.var matches 0.. store result score #__error_count__ pmc.var store result score #__i__ pmc.var run data get storage pmc:io error[-1]

# 异常拦截返回
function pmc:class/error/method/catch/1.1

# 弹出异常栈帧
scoreboard players remove #__error__ pmc.var 1
data remove storage pmc:io error[-1]

# 返回
return run scoreboard players get #__error_count__ pmc.var
