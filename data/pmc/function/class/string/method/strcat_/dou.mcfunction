#math:string/_to_raw
# 临时对象转换为原生字符串
# 输出storage math:io result

# 防止string_chars为空
data modify storage math:io result set value ""

# 两两合并
# 字符串列表副本
data modify storage math:io temp set from storage math:io string_chars
# 列表元素数继承
scoreboard players operation ssloop int = string_n int
# 归并
execute if score ssloop int matches 2.. run function math:string/to_raw/loop
    # 迭代temp中要合并的字符串
    # 转移字符串副本至
    data modify storage math:io stemp set from storage math:io temp
    data modify storage math:io temp set value []
    # 计算合并后字符串数量
    scoreboard players operation sstemp_cnt int = ssloop int
    scoreboard players operation sstemp_mod int = ssloop int
    # 组数
    scoreboard players operation sstemp_cnt int /= 2 int
    # 余项
    scoreboard players operation sstemp_mod int %= 2 int
    # 两两合并
    execute if score sstemp_cnt int matches 1.. run function math:string/to_raw/sloop
        # 合并操作
        data modify storage math:io stemp[0].char_next set from storage math:io stemp[1].char
        function math:string/to_raw/merge with storage math:io stemp[0]
            $data modify storage math:io temp append value {char:'$(char)$(char_next)'}
        data remove storage math:io stemp[0]
        data remove storage math:io stemp[0]
        scoreboard players remove sstemp_cnt int 1
        execute if score sstemp_cnt int matches 1.. run function math:string/to_raw/sloop
    # 奇数多合并一次
    execute if score sstemp_mod int matches 1 run function math:string/to_raw/single
        data modify storage math:io stemp[0].char_next set from storage math:io stemp[0].char
        data modify storage math:io stemp[0].char set from storage math:io temp[-1].char
        data remove storage math:io temp[-1]
        function math:string/to_raw/merge with storage math:io stemp[0]
            $data modify storage math:io temp append value {char:'$(char)$(char_next)'}
    scoreboard players operation ssloop int /= 2 int
    execute if score ssloop int matches 2.. run function math:string/to_raw/loop
data modify storage math:io result set from storage math:io temp[0].char