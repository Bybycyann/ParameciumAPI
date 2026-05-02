# 打印异常消息

data modify storage pmc:io stack[-1].error.str_tmp.a set from storage pmc:io stack[-1].error.message
data modify entity 504D43-44-0-0-1 text set value {storage: "pmc:io", nbt: "stack[-1].error.str_tmp"}
data modify storage pmc:io stack[-1].error.str_tmp set string entity 504D43-44-0-0-1 text 3 -1
function pmc:class/error/method/catch/1.1.1.1 with storage pmc:io stack[-1].error
