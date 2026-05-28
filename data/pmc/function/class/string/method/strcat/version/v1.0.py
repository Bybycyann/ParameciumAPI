def strcat(source: list, sep = ""):

    fragNum = len(source)
    if fragNum == 0:
        return ""
    if fragNum == 1:
        return source[0]

    result = source

    while True:
        if not fragNum >= 2:
            break

        copy = result
        result = []
        
        groupNum = int(fragNum / 2)
        mod = fragNum % 2
        fragNum -= groupNum
        
        while True:
            if not groupNum > 0:
                break
            groupNum -= 1
            
            left = copy[0]
            right = copy[1]
            result.append(f"{left}{sep}{right}")
            copy.pop(0)
            copy.pop(0)
        if mod == 1:
            result.append(copy[0])
    return result
        
        
print(strcat(source=['测','试','文','本','咕咕嘎嘎','噶啊?','何意味啊','test','nyahahahaha','你是谁啊~'], sep = " "))