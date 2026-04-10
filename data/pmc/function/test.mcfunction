# 解锁异常栈
function #pmc:error.try
    # 抛出一个异常
    function #pmc:error.throw {"args":{"type": "errorType", "function":"#namespace:path", "message":"testText1."}}
    function #pmc:error.throw {"args":{"type": "errorType", "function":"#namespace:path", "message":{"text": "testTextComponent2.", "color": "gold"}}}
# 拦截一个异常
execute if function #pmc:error.catch run return run tellraw @a {translate: "[debug] 捕获了%s个异常.",with:[{score:{name:"#__error_count__",objective:"pmc.var"}}]}

tellraw @a {text: "[debug] 没有异常被捕获."}
