# 单元素返回

data modify storage pmc:io return set from storage pmc:io stack[-1].PARAM.arr
data remove storage pmc:io stack[-1]
