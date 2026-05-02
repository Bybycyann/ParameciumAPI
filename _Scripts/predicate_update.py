from pathlib import Path
import json
from box import Box

def main():
    # 数据包根目录
    script_dir = Path(__file__).parent.absolute()
    base = script_dir.parent

    # 检查目录与pack.mcmeta
    if script_dir.name != "_Scripts" or not Path.exists(base/'pack.mcmeta'):
        print('\033[31m' + 'ERROR：请将脚本置于 "pack/_Scripts/" 目录下使用！' + '\033[0m')
        return False
    
    # 抓取目标函数文件
    function = base.glob('data/*/enchantment/**/*.json')
    for file in function:
        # 检查文件是否存在
        if not file.exists():
            continue
        # 解析魔咒文件
        try:
            with file.open('r', encoding='utf-8') as f:
                ench = Box(json.load(f))
        except json.JSONDecodeError as e:
            print('\033[31m' + f"ERROR：无效的JSON对象：{e}" + '\033[0m')
            continue
        ench.
        print('\033[32m' + '已处理文件：' + f'{file.parents[-1]}' + '\033[0m')

main()
