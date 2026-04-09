# 字符串拼接

data modify storage pmc:io stack[-1].PARAM.sep append from storage pmc:io stack[-1].PARAM.sep[0]
data remove storage pmc:io stack[-1].PARAM.sep[0]
