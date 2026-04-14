# {"Config": false}
# Function Cache - (Script)
data modify storage pmc:io return set from storage pmc:io cache."pmc:list".sort[1].value
data modify storage pmc:io stack[-1].cache_tmp set from storage pmc:io cache."pmc:list".sort[1]
data remove storage pmc:io cache."pmc:list".sort[1]
data modify storage pmc:io cache."pmc:list".sort prepend from storage pmc:io stack[-1].cache_tmp
