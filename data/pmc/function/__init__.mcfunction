# __init__

execute if data storage pmc:pack {"idList": ["paramecium_api"]} run return 1

execute unless data storage pmc:pack idList run data merge storage pmc:pack {"idList": []}
data modify storage pmc:pack idList append value "paramecium_api"
data modify storage pmc:pack packInfo merge value {"paramcium_api":{"id": "paramecium_api", "version": "alpha-1.0", "namespace": "pmc", "requires": []}}

# branch init
function pmc:class/entity/__init__
function pmc:class/timer/__init__

# scoreboard
    # variables
    scoreboard objectives add pmc.var dummy [{"text":"PMC ","color":"aqua"},{"text":"Variables","color":"gold"}]
    # constant
    scoreboard objectives add pmc.const dummy [{"text":"PMC ","color":"aqua"},{"text":"Constant","color":"gold"}]
        # 1~20
        scoreboard players set #1 pmc.const 1
        scoreboard players set #2 pmc.const 2
        scoreboard players set #3 pmc.const 3
        scoreboard players set #4 pmc.const 4
        scoreboard players set #5 pmc.const 5
        scoreboard players set #6 pmc.const 6
        scoreboard players set #7 pmc.const 7
        scoreboard players set #8 pmc.const 8
        scoreboard players set #9 pmc.const 9
        scoreboard players set #10 pmc.const 10
        scoreboard players set #11 pmc.const 11
        scoreboard players set #12 pmc.const 12
        scoreboard players set #13 pmc.const 13
        scoreboard players set #14 pmc.const 14
        scoreboard players set #15 pmc.const 15
        scoreboard players set #16 pmc.const 16
        scoreboard players set #17 pmc.const 17
        scoreboard players set #18 pmc.const 18
        scoreboard players set #19 pmc.const 19
        scoreboard players set #20 pmc.const 20
        # 1e2~1e4
        scoreboard players set #1e2 pmc.const 100
        scoreboard players set #1e3 pmc.const 1000
        scoreboard players set #1e4 pmc.const 10000
        # 2e5~2e10
        scoreboard players set #2e5 pmc.const 32
        scoreboard players set #2e6 pmc.const 64
        scoreboard players set #2e7 pmc.const 128
        scoreboard players set #2e8 pmc.const 256
        scoreboard players set #2e9 pmc.const 512
        scoreboard players set #2e10 pmc.const 1024
    # Criteria
    scoreboard objectives add pmc.crit dummy [{"text":"PMC ","color":"aqua"},{"text":"Criteria","color":"gold"}]
