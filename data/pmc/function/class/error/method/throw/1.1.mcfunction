data modify storage pmc:io stack[-1].CONTEXT.args.str set from storage pmc:io stack[-1].PARAM.function
data modify storage pmc:io stack[-1].CONTEXT.args merge value {old: "#", new: "", num: 1}
function #pmc:str.replace

data modify storage pmc:io stack[-1].CONTEXT.args set value {}
data modify storage pmc:io stack[-1].CONTEXT.args.str set from storage pmc:io return
data modify storage pmc:io stack[-1].CONTEXT.args merge value {sep: ":", num: 1}
function #pmc:str.split

data modify storage pmc:io stack[-1].error.namespace set from storage pmc:io return[0]
