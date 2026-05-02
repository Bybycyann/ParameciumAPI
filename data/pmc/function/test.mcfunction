# data modify storage pmc:io stack append value {}

# # 解锁异常栈
# function #pmc:error.try
#     # 抛出多个异常
#     function #pmc:error.throw {"args":{"type": "errorType", "function":"#namespace:path", "message":"testText1."}}
#     function #pmc:error.throw {"args":{"type": "errorType", "function":"#namespace:path", "message":{"text": "testTextComponent2.", "color": "gold"}}}
# # 拦截一个异常
# execute if function #pmc:error.catch run tellraw @a {translate: "[debug] 捕获了%s个异常.",with:[{score:{name:"#__error_count__",objective:"pmc.var"}}]}

# function #pmc:str.strcat
# tellraw @a {translate: '[OUTPUT]: %s', with: [{type:'nbt', storage: 'pmc:io', nbt: 'return', color: 'aqua'}], color: 'white'}

# function pmc:class/string/split_new/main
function #pmc:str.split
tellraw @a {type:'nbt',storage:'pmc:io',nbt:'return'}


# data remove storage pmc:io stack[-1]