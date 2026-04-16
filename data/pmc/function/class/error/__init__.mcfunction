# error.__init__

# 重置异常栈
data modify storage pmc:io error set value []
scoreboard players set #__error__ pmc.var -1
scoreboard players set #__error_count__ pmc.var 0
