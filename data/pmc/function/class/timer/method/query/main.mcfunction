# {"Config": false}
# timer.query()
# --------------------
# 返回时长(ms)并销毁顶层计时器
# --------------------

execute store result score #__t__ pmc.var run stopwatch query pmc:timer 1000
execute store result score #__o__ pmc.var run data get storage pmc:io stack[-1].TIMER[-1]
data remove storage pmc:io stack[-1].TIMER[-1]
return run scoreboard players operation #__t__ pmc.var -= #__o__ pmc.var
