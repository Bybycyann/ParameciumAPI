execute if score #__fragNum__ pmc.var matches 0 run \
    data modify storage pmc:io return set value ""
data modify storage pmc:io return set from storage pmc:io stack[-1].PARAM.source[0]
data remove storage pmc:io stack[-1]
