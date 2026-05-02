def MergeSort(arr: list):
    arrArg = []
    _len_ = len(arr)
    if _len_ <= 1:
        return arr
    _len_ /= 2
    while _len_ > 0:
        _len_ -= 1
        arrArg.append(arr[0])
        arr.pop(0)
    left = MergeSort(arrArg)
    right = MergeSort(arr)
    return Merge(left, right)
 
def Merge(left,right):
    llen = len(left)
    rlen = len(right)
    r, l=0, 0
    result=[]
    while l < llen and r < rlen:
        if left[0] <= right[0]:
            result.append(left[0])
            left.pop(0)
            l += 1
        else:
            result.append(right[0])
            right.pop(0)
            r += 1
    result += list(left[:])
    result += list(right[:])
    return result

print(MergeSort([2, 9, 1, 8, 3, 6, 45, 38, 39, 27]))