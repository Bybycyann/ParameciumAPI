stack = []

def str_split(args: dict):
    # Input
    PARAM = {'sep': ' ','mark': None, 'num': 2147483647}
    PARAM.update(args)
    # Error
    if 'str' not in PARAM:
        return print('缺少必要的参数: "str".')
    # Main
    RESULT = []
    strLen = len(PARAM['str'])
    sepLen = len(PARAM['sep'])
    splitNum = PARAM['num']
    ptr = 0
    strC = PARAM['str']
    # 切片函数
    while strLen >= sepLen and splitNum >= 1:
        frag = strC[0:sepLen]                   # *Macro
        if frag == PARAM['sep']:
            splitNum -= 1       # 计数
            strLen -= sepLen    # 剩余字符串长度
            ptr0 = ptr          # 截取前半
            ptr += sepLen       # 截取后半
            RESULT.append(PARAM['str'][0:ptr0])  # *Macro
            PARAM['str'] = PARAM['str'][ptr:]   # *Macro
            ptr = 0             # 更新指针
            strC = PARAM['str']
            if not PARAM['mark'] == None:       # 追加标记
                RESULT.append(PARAM['mark'])
            continue
        else:
            strLen -= 1
            ptr += 1
            strC = strC[1:]
    RESULT.append(PARAM['str'])
    return RESULT

def main():
    stack.append({'args': {'str':"a:b:c:::::d::::e:f:g:",'sep':":",'mark':"@"}})
    return str_split(stack[-1]['args'])

print(main())