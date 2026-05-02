# data modify storage pmc:io stack append value {}

# 解锁异常栈
function #pmc:error.try
    # 抛出多个异常
    function #pmc:error.throw {"args":{"type": "error","tag": "tmptag", "function":"#namespace:path", "message":"testText1.", hide: true}}
    function #pmc:error.throw {"args":{"type": "error", "function":"#namespace:path", "message":{"text": "testTextComponent2.", "color": "gold"},hide: true}}

    # 抓取异常标签
    execute if data storage pmc:io error[-1][{"tag":"tmptag"}] run tellraw @a {text:"[debug] 抓取异常标签"}
    
# 拦截一个异常
execute if function #pmc:error.catch run tellraw @a {translate: "[debug] 捕获了%s个异常.",with:[{score:{name:"#__error_count__",objective:"pmc.var"}}]}

# function #pmc:str.strcat
# tellraw @a {translate: '[OUTPUT]: %s', with: [{type:'nbt', storage: 'pmc:io', nbt: 'return', color: 'aqua'}], color: 'white'}

# function #pmc:str.strcat

# data remove storage pmc:io stack[-1]