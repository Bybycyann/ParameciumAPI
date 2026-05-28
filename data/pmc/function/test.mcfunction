# 异常测试
# - 需将命名空间解析从throw阶段转移至catch阶段
# - str.strcat 函数的异常抛出标签还是测试标签别忘了改
function #pmc:error.try
    function #pmc:str.strcat
    execute if data storage pmc:io error[-1][{"tag":"exampleTag"}] run data modify storage pmc:io error[-1][{"tag":"exampleTag"}] merge value {"hide": false}
execute if function #pmc:error.catch run tellraw @a {"text": "存在异常."}
tellraw @a {translate: '[OUTPUT]: %s', with: [{type:'nbt', storage: 'pmc:io', nbt: 'return', color: 'aqua'}], color: 'white'}

# data remove storage pmc:io stack[-1]

# data modify storage io Pos1 set from entity @s Pos
# data modify storage io Pos2 set from entity Target Pos
# execute store result storage io distance int 1 facing entity Target feet positioned 0. 0. 0. summon marker run function
#     kill
#     data modify storage io Pos0 set from entity @s Pos
#     execute store result score #x0 var run data get storage io Pos0[0]
#     execute store result score #y0 var run data get storage io Pos0[1]
#     execute store result score #z0 var run data get storage io Pos0[2]
#     execute store result score #x1 var run data get storage io Pos1[0]
#     execute store result score #y1 var run data get storage io Pos1[1]
#     execute store result score #z1 var run data get storage io Pos1[2]
#     execute store result score #x2 var run data get storage io Pos2[0]
#     execute store result score #y2 var run data get storage io Pos2[1]
#     execute store result score #z2 var run data get storage io Pos2[2]
#     scoreboard players operation #x1 var -= #x2 var
#     scoreboard players operation #y1 var -= #y2 var
#     scoreboard players operation #z1 var -= #z2 var
#     scoreboard players operation #x1 var += #y1 var
#     scoreboard players operation #x1 var += #z1 var
#     scoreboard players operation #x0 var += #y0 var
#     scoreboard players operation #x0 var += #z0 var
#     return run scoreboard players operation #x0 var /= #x1 var
