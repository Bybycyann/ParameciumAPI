execute unless function pmc:class/string/split/predicate/loop_conditions run return 1
function pmc:class/string/split/1.1.1 with storage pmc:io stack[-1]
execute unless function pmc:class/string/split/predicate/frag_contrast run return run function pmc:class/string/split/1.1.2
scoreboard players remove #__strLen__ pmc.var 1
scoreboard players add #__ptr__ pmc.var 1
data modify storage pmc:io stack[-1].strC set string storage pmc:io stack[-1].strC 1
function pmc:class/string/split/1.1
