# entity.__init__

# Attribute
    data modify storage pmc:io class.entity.attribute set value {\
        "id": str,\
        "UUID": int_array,\
        "Tags": list,\
        "Pos": list,\
    }
# Instance
    # 实体指针
    data modify storage pmc:io class.entity.instance merge value {\
        "504D43-44-0-0-0": {\
            "id": "minecraft:interaction",\
            "UUID": [I;5262659,4456448,0,0],\
            "Tags": ["smithed.entity"],\
            "Pos": [0.0,0.0,0.0],\
        }\
    }
    # 文本解析器 & 线性运算器 & 简单字符集合表
    data modify storage pmc:io class.entity.instance merge value {\
        "504D43-44-0-0-1": {\
            "id": "minecraft:text_display",\
            "UUID": [I;5262659,4456448,0,1],\
            "Tags": ["smithed.entity"],\
            "Pos": [0.0,0.0,0.0],\
        }\
    }

execute in pmc:technical positioned 0. 0. 0. rotated 0. 0. run function pmc:class/entity/fun/__init__/1
