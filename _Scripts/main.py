from pathlib import Path
import json

class mcfunction:
    def __init__(self, obj: dict):
        self.namespace = obj.get('namespace', None)
        self.path = str(obj.get('path', None))
        self.directive = obj.get('directive', None)
        self.directory = Path(obj.get('directory', None))
        self.name = f'{self.directory.parts[-1]}'
        if self.path.split(':')[1].split('/')[0] in 'class':
            self._class = obj.get('class', f'{self.namespace}:{self.path.split(':')[1].split('/')[1]}')

def Cache(mcf: mcfunction):
    cache_path = mcf.directory/'cache'
    (cache_path/'update').mkdir(parents=True, exist_ok=True)
    (cache_path/'write').mkdir(parents=True, exist_ok=True)
    '''
    若存在类则根据类名创建缓存分支, 不存在则根据函数名创建缓存分支
    '''
    if mcf._class:
        tag = mcf._class
    else:
        tag = mcf.path
    templates = {
'main': f'''# {{"Config": false}}
# Function Cache - (Script)
data modify storage pmc:io stack append value {{}}
data modify storage pmc:io stack[-1].copy set from storage pmc:io stack[-2].CONTEXT.args
execute store result score #__index__ pmc.var run function {mcf.path}/cache/compare
execute if score #__index__ pmc.var matches -1 run return run function {mcf.path}/cache/write/key
function {mcf.path}/cache/update/main
data remove storage pmc:io stack[-1]
return 1
''',
'compare': f'''# {{"Config": false}}
# Function Cache - (Script)
data modify storage pmc:io stack[-1].in0 set from storage pmc:io stack[-1].copy
data modify storage pmc:io stack[-1].in1 set from storage pmc:io stack[-1].copy
data modify storage pmc:io stack[-1].in2 set from storage pmc:io stack[-1].copy
data modify storage pmc:io stack[-1].in3 set from storage pmc:io stack[-1].copy
data modify storage pmc:io stack[-1].in4 set from storage pmc:io stack[-1].copy
scoreboard players set #__bool__ pmc.var 1
execute if data storage pmc:io cache."{tag}".{mcf.name}[0] store success score #__bool__ pmc.var run data modify storage pmc:io stack[-1].in0 set from storage pmc:io cache."{tag}".{mcf.name}[0].key
execute if score #__bool__ pmc.var matches 0 run return 0
execute if data storage pmc:io cache."{tag}".{mcf.name}[1] store success score #__bool__ pmc.var run data modify storage pmc:io stack[-1].in1 set from storage pmc:io cache."{tag}".{mcf.name}[1].key
execute if score #__bool__ pmc.var matches 0 run return 1
execute if data storage pmc:io cache."{tag}".{mcf.name}[2] store success score #__bool__ pmc.var run data modify storage pmc:io stack[-1].in2 set from storage pmc:io cache."{tag}".{mcf.name}[2].key
execute if score #__bool__ pmc.var matches 0 run return 2
execute if data storage pmc:io cache."{tag}".{mcf.name}[3] store success score #__bool__ pmc.var run data modify storage pmc:io stack[-1].in3 set from storage pmc:io cache."{tag}".{mcf.name}[3].key
execute if score #__bool__ pmc.var matches 0 run return 3
execute if data storage pmc:io cache."{tag}".{mcf.name}[4] store success score #__bool__ pmc.var run data modify storage pmc:io stack[-1].in4 set from storage pmc:io cache."{tag}".{mcf.name}[4].key
execute if score #__bool__ pmc.var matches 0 run return 4
return -1
''',
'write_key': f'''# {{"Config": false}}
# Function Cache - (Script)
execute store result score #__num__ pmc.var run data get storage pmc:io cache."{tag}".{mcf.name}
execute if score #__num__ pmc.var matches 5.. run data remove storage pmc:io cache."{tag}".{mcf.name}[-1]
data modify storage pmc:io cache."{tag}".{mcf.name} prepend value {{"value": "#Cache#"}}
data modify storage pmc:io cache."{tag}".{mcf.name}[0].key set from storage pmc:io stack[-1].copy
data remove storage pmc:io stack[-1]
return 0
''',
'write_value': f'''# {{"Config": false}}
# Function Cache - (Script)
execute if data storage pmc:io cache."{tag}".{mcf.name}[{{"value": "#Cache#"}}] run data modify storage pmc:io cache."{tag}".{mcf.name}[0].value set from storage pmc:io return
''',
'update_main': f'''# {{"Config": false}}
# Function Cache - (Script)
execute if score #__index__ pmc.var matches 0 run return run function {mcf.path}/cache/update/0
execute if score #__index__ pmc.var matches 1 run return run function {mcf.path}/cache/update/1
execute if score #__index__ pmc.var matches 2 run return run function {mcf.path}/cache/update/2
execute if score #__index__ pmc.var matches 3 run return run function {mcf.path}/cache/update/3
execute if score #__index__ pmc.var matches 4 run return run function {mcf.path}/cache/update/4
''',
'update_0': f'''# {{"Config": false}}
# Function Cache - (Script)
data modify storage pmc:io return set from storage pmc:io cache."{tag}".{mcf.name}[0].value
''',
'update_1': f'''# {{"Config": false}}
# Function Cache - (Script)
data modify storage pmc:io return set from storage pmc:io cache."{tag}".{mcf.name}[1].value
data modify storage pmc:io stack[-1].cache_tmp set from storage pmc:io cache."{tag}".{mcf.name}[1]
data remove storage pmc:io cache."{tag}".{mcf.name}[1]
data modify storage pmc:io cache."{tag}".{mcf.name} prepend from storage pmc:io stack[-1].cache_tmp
''',
'update_2': f'''# {{"Config": false}}
# Function Cache - (Script)
data modify storage pmc:io return set from storage pmc:io cache."{tag}".{mcf.name}[2].value
data modify storage pmc:io stack[-1].cache_tmp set from storage pmc:io cache."{tag}".{mcf.name}[2]
data remove storage pmc:io cache."{tag}".{mcf.name}[2]
data modify storage pmc:io cache."{tag}".{mcf.name} prepend from storage pmc:io stack[-1].cache_tmp
''',
'update_3': f'''# {{"Config": false}}
# Function Cache - (Script)
data modify storage pmc:io return set from storage pmc:io cache."{tag}".{mcf.name}[3].value
data modify storage pmc:io stack[-1].cache_tmp set from storage pmc:io cache."{tag}".{mcf.name}[3]
data remove storage pmc:io cache."{tag}".{mcf.name}[3]
data modify storage pmc:io cache."{tag}".{mcf.name} prepend from storage pmc:io stack[-1].cache_tmp
''',
'update_4': f'''# {{"Config": false}}
# Function Cache - (Script)
data modify storage pmc:io return set from storage pmc:io cache."{tag}".{mcf.name}[4].value
data modify storage pmc:io stack[-1].cache_tmp set from storage pmc:io cache."{tag}".{mcf.name}[4]
data remove storage pmc:io cache."{tag}".{mcf.name}[4]
data modify storage pmc:io cache."{tag}".{mcf.name} prepend from storage pmc:io stack[-1].cache_tmp
'''
}
    Path(cache_path/'main.mcfunction').write_text(templates['main'], encoding='utf-8')
    Path(cache_path/'compare.mcfunction').write_text(templates['compare'], encoding='utf-8')
    Path(cache_path/'write'/'key.mcfunction').write_text(templates['write_key'], encoding='utf-8')
    Path(cache_path/'write'/'value.mcfunction').write_text(templates['write_value'], encoding='utf-8')
    Path(cache_path/'update'/'main.mcfunction').write_text(templates['update_main'], encoding='utf-8')
    Path(cache_path/'update'/'0.mcfunction').write_text(templates['update_0'], encoding='utf-8')
    Path(cache_path/'update'/'1.mcfunction').write_text(templates['update_1'], encoding='utf-8')
    Path(cache_path/'update'/'2.mcfunction').write_text(templates['update_2'], encoding='utf-8')
    Path(cache_path/'update'/'3.mcfunction').write_text(templates['update_3'], encoding='utf-8')
    Path(cache_path/'update'/'4.mcfunction').write_text(templates['update_4'], encoding='utf-8')
    pass
    

def main():
    # 数据包根目录
    script_dir = Path(__file__).parent.absolute()
    base = script_dir.parent

    # 检查目录与pack.mcmeta
    if script_dir.name != "_Scripts" or not Path.exists(base/'pack.mcmeta'):
        print('\033[31m' + 'ERROR：请将脚本置于 "pack/_Scripts/" 目录下使用！' + '\033[0m')
        return False
    
    # 抓取目标函数文件
    function = base.glob('data/*/function/**/main.mcfunction')
    for file in function:
        # 检查文件是否存在
        if not file.exists():
            continue
        # 读取文件第一行
        try:
            with open(file, 'r', encoding='utf-8') as f:
                function_info = f.readline().strip('# ')
        except UnicodeDecodeError:
            print('\033[31m' + f'ERROR: 无法解码文件：{file}' + '\033[0m')
            continue
        # 解析json文本
        try:
            obj = dict(json.loads(function_info))
        except json.JSONDecodeError as e:
            print('\033[31m' + f"ERROR：无效的JSON对象：{e}" + '\033[0m')
            continue
        # 手动跳过
        if obj.get('Config') == False: continue
        # 补充函数信息
        obj['namespace'] = file.relative_to(base/'data').parts[0]
        function_path = str(file.relative_to(base/'data'/obj['namespace']/'function').parent).replace('\\','/')
        obj['path'] = f'{obj['namespace']}:{function_path}'
        obj['directory'] = file.parent
        # 实例化函数对象
        mcf = mcfunction(obj)

        # 执行预处理指令
        if mcf.directive and '@Cache' in mcf.directive: Cache(mcf)

main()
