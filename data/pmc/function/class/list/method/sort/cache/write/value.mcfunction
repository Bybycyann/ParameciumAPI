# {"Config": false}
# Function Cache - (Script)
execute if data storage pmc:io cache."pmc:list".sort[{value: "#Cache#"}] run data modify storage pmc:io cache."pmc:list".sort[0].value set from storage pmc:io return
