# 打印异常消息

$tellraw @s [\
    {\
        "translate":"[%s] ",\
        "with": [{\
            "type": "nbt",\
            "storage": "pmc:io",\
            "nbt": "stack[-1].error.namespace"\
        }],\
        "color": "#FFFFFF"\
    },\
    {\
        "translate":"%s:%s",\
        "with":[\
            {\
                "type": "nbt",\
                "storage": "pmc:io",\
                "nbt": "stack[-1].error.type"\
            },\
            $(str_tmp)\
        ],\
        "color":"red",\
        "hover_event":{\
            "action":"show_text",\
            "value":[{\
                "type": "nbt",\
                "storage": "pmc:io",\
                "nbt": "stack[-1].error.function",\
                "color": "yellow"\
            }]\
        }}\
    ]