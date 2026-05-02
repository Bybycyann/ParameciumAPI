# {"Config": false}
# fun_time()
# --------------------
# 测试函数的平均运行时
# --------------------

$data modify storage pmc:io stack append value {CONTEXT:{args: $(args)}}
function #pmc:timer.create

$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)
$function $(function)

execute store result storage pmc:io stack[-1].time double 0.01 run function #pmc:timer.query
data modify entity 504D43-44-0-0-1 text set value {"type": "nbt", "storage": "pmc:io", "nbt": "stack[-1].time"}
data modify storage pmc:io stack[-1].CONTEXT.args set value {"old": "d", "new": "", "num": 1}
data modify storage pmc:io stack[-1].CONTEXT.args.str set from entity 504D43-44-0-0-1 text
function #pmc:str.replace
data modify storage pmc:io stack[-1].CONTEXT.args set value {"sep": ".", "num": 1}
data modify storage pmc:io stack[-1].CONTEXT.args.str set from storage pmc:io return
function #pmc:str.split
data modify storage pmc:io return[-1] set string storage pmc:io return[-1] 0 2
data modify storage pmc:io stack[-1].CONTEXT.args set value {"sep": ["."]}
data modify storage pmc:io stack[-1].CONTEXT.args.source set from storage pmc:io return
function #pmc:str.strcat
tellraw @s {"translate": "函数运行时间：%s ms", "with": [{"type": "nbt", "storage": "pmc:io", "nbt": "return"}]}
data remove storage pmc:io stack[-1]
