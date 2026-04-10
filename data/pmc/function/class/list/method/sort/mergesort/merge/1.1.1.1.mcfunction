# left

data modify storage pmc:io stack[-1].result append from storage pmc:io stack[-1].PARAM.left[0]
data remove storage pmc:io stack[-1].PARAM.left[0]
scoreboard players add #__l__ pmc.var 1
