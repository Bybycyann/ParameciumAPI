# {"Config": false}
# timer.create()
# --------------------
# 创建一个计时器
# (函数栈)
# --------------------

data modify storage pmc:io stack append value {}
execute store result storage pmc:io stack[-1].ts int 1 run stopwatch query pmc:timer 1000
data modify storage pmc:io stack[-2].TIMER append from storage pmc:io stack[-1].ts
data remove storage pmc:io stack[-1]
