# loop condition
execute unless score #__fragNum__ pmc.var matches 2.. run return 1

# state inheritance
data modify storage pmc:io stack[-1].copy set from storage pmc:io stack[-1].result
data modify storage pmc:io stack[-1].result set value []

# state var
scoreboard players operation #__groupNum__ pmc.var = #__fragNum__ pmc.var
scoreboard players operation #__mod__ pmc.var = #__fragNum__ pmc.var

scoreboard players operation #__groupNum__ pmc.var /= #2 pmc.const
scoreboard players operation #__mod__ pmc.var %= #2 pmc.const
scoreboard players operation #__fragNum__ pmc.var -= #__groupNum__ pmc.var

function pmc:class/string/method/strcat_/1.2.1
# add rem
execute if score #__mod__ pmc.var matches 1 run \
    data modify storage pmc:io stack[-1].result append from storage pmc:io stack[-1].copy[0]
# loop
function pmc:class/string/method/strcat_/1.2
