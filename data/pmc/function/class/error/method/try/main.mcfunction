# error.try()
# --------------------
# 运行一个尝试
# 激活一个异常栈帧, 尝试捕获一个异常
# --------------------

# 压入异常栈帧
scoreboard players add #__error__ pmc.var 1
scoreboard players set #__error_count__ pmc.var 0
data modify storage pmc:io error append value []
