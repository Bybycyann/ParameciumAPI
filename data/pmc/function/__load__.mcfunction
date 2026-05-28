# __load__

# debug
data remove storage pmc:pack idList

# init
function pmc:__init__

# branch load
function pmc:class/error/__load__
function pmc:class/timer/__load__

# gamerule
function pmc:__gamerule__

# 缓存释放
data remove storage pmc:io cache

# 栈重置
data modify storage pmc:io stack_tmp set from storage pmc:io stack[0]
data modify storage pmc:io stack set value []
data modify storage pmc:io stack append from storage pmc:io stack_tmp
data remove storage pmc:io stack_tmp
