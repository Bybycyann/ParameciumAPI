# loop condition
execute unless score #__groupNum__ pmc.var matches 1.. run return 1
scoreboard players remove #__groupNum__ pmc.var 1
# escape & macro cat
data modify storage pmc:io stack[-1].CONTEXT.args.str set from storage pmc:io stack[-1].copy[0]
function #pmc:str.escape
data modify storage pmc:io stack[-1].left set from storage pmc:io return
data modify storage pmc:io stack[-1].CONTEXT.args.str set from storage pmc:io stack[-1].copy[1]
function #pmc:str.escape
data modify storage pmc:io stack[-1].right set from storage pmc:io return
function pmc:class/string/method/strcat_/1.2.1.1 with storage pmc:io stack[-1]
data remove storage pmc:io stack[-1].copy[0]
data remove storage pmc:io stack[-1].copy[0]
# loop
function pmc:class/string/method/strcat_/1.2.1
