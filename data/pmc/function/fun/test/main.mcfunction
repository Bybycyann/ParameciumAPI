# {"Config": false}

execute store result score #i pmc.var run data get entity Kyifyuy SelectedItemSlot
scoreboard players operation #j pmc.var -= #i pmc.var
execute if score #j pmc.var matches 0 run return run scoreboard players operation #j pmc.var = #i pmc.var
tellraw @a {translate:'[调试] 移动了%s个槽位',with:[{type: "score", score: {name: '#j', objective: 'pmc.var'}}]}
scoreboard players operation #j pmc.var = #i pmc.var