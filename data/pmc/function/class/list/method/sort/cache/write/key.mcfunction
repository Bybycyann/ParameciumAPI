# {"Config": false}
# Function Cache - (Script)
execute store result score #__num__ pmc.var run data get storage pmc:io cache."pmc:list".sort
execute if score #__num__ pmc.var matches 5.. run data remove storage pmc:io cache."pmc:list".sort[-1]
data modify storage pmc:io cache."pmc:list".sort prepend value {"value": "#Cache#"}
data modify storage pmc:io cache."pmc:list".sort[0].key set from storage pmc:io stack[-1].copy
data remove storage pmc:io stack[-1]
return 0
