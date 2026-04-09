forceload add -1 -1 1 1
execute unless block 0 0 0 minecraft:barrel run setblock 0 0 0 minecraft:barrel{"CustomName": "Item Stack"}
# ASCII 0x namespace-class_mark-0-0-number
# PMC-D-0-0-0-x
execute unless entity 504D43-44-0-0-0 run summon minecraft:interaction 0. 0. 0. {Tags:["smithed.entity"],UUID:[I;5262659,4456448,0,0]}
execute unless entity 504D43-44-0-0-1 run summon minecraft:text_display 0. 0. 0. {Tags:["smithed.entity"],UUID:[I;5262659,4456448,0,1]}
