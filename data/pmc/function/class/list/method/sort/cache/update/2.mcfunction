# 缓存更新

data modify storage pmc:io return set from storage pmc:io cache."pmc:list".sort[2].value
data modify storage pmc:io stack[-1].cache_tmp set from storage pmc:io cache."pmc:list".sort[2]
data remove storage pmc:io cache."pmc:list".sort[2]
data modify storage pmc:io cache."pmc:list".sort prepend from storage pmc:io stack[-1].cache_tmp
