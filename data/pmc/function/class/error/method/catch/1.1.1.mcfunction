# 打印异常消息

data modify storage pmc:io error[-1][-1].str_tmp.a set from storage pmc:io error[-1][-1].message
data modify entity 504D43-44-0-0-1 text set value {storage: "pmc:io", nbt: "error[-1][-1].str_tmp"}
data modify storage pmc:io error[-1][-1].str_tmp set string entity 504D43-44-0-0-1 text 3 -1
function pmc:class/error/method/catch/1.1.1.1 with storage pmc:io error[-1][-1]
