# 打印异常消息

$tellraw @s [\
    {\
        "translate":"[%s] ",\
        "with": [{\
            "type": "nbt",\
            "storage": "pmc:io",\
            "nbt": "error[-1][-1].namespace"\
        }],\
        "color": "#FFFFFF"\
    },\
    {\
        "translate":"%s:%s",\
        "with":[\
            {\
                "type": "nbt",\
                "storage": "pmc:io",\
                "nbt": "error[-1][-1].type"\
            },\
            $(str_tmp)\
        ],\
        "color":"red",\
        "hover_event":{\
            "action":"show_text",\
            "value":[{\
                "type": "nbt",\
                "storage": "pmc:io",\
                "nbt": "error[-1][-1].function",\
                "color": "yellow"\
            }]\
        }}\
    ]