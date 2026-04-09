# range 判据

execute if score #__a__ pmc.var >= #__b__ pmc.var run return 1
execute if score #__a__ pmc.var matches ..-1 run return 1
execute if score #__a__ pmc.var > #__len__ pmc.var run return 1
execute if score #__b__ pmc.var matches ..-1 run return 1
execute if score #__b__ pmc.var > #__len__ pmc.var run return 1
return 0
