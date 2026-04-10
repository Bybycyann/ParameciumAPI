# 排序循环判据

execute if score #__l__ pmc.var < #__llen__ pmc.var if score #__r__ pmc.var < #__rlen__ pmc.var run return 1
return 0
