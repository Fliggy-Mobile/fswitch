# coding=utf-8
import os
import sys


def print_error(s):
    print ('\033[0;31mError: {content}\033[0m'.format(content=s))


def print_color(s, mode='0', color='37'):
    return '\033[{mode};{color}m{content}\033[0m'.format(mode=mode, color=color, content=s)


# text是否包含content
def is_contain(text, content):
    text = str(text)
    content = str(content)
    if text.find(content) != -1:
        return True
    else:
        return False


def is_empty(s):
    return s is None or len(s) == 0


def runCmd(cmd):
    # print (cmd)
    f = os.popen(cmd)
    text = f.read()
    f.close()
    return text



def get_name_in_yaml(yaml_path):
    name = ''
    with open(yaml_path, mode='r') as projects_yaml:
        lines = projects_yaml.readlines()
        for line in lines:
            if line.startswith("name:"):
                name = line.strip().lstrip().rstrip(',').replace(' ', '').split(':')[1]
                break
    return name


def create_readme():
    readme_path = 'README.md'
    yaml_path = 'pubspec.yaml'
    if not os.path.exists(yaml_path):
        print_error("项目缺少 pubspec.yaml 配置文件，请检查项目配置文件是否存在或路径是否正确")
        return
    with open(readme_path, 'w+') as readme:
        project_name = get_name_in_yaml(yaml_path)
        lines = []
        lines.append("# " + project_name)
        lines.append("\n\n")
        lines.append("# fapi/" + project_name)
        lines.append("\n\n")
        lines.append("![](https://badgen.net/badge/tnpm/请自行填写-组件最新tag版本号/blue)")
        lines.append("\n\n")
        lines.append("> [使用前请参考【Flutter组件开发使用文档】](https://yuque.antfin-inc.com/hummingbird/flutter-guide/sv9shr)")
        lines.append("\n\n")
        lines.append("* 主理人：请自行填写-名称 <请自行填写-邮箱>")
        lines.append("\n\n")
        lines.append("# 设计规范")
        lines.append("\n\n")
        lines.append('<img src="请自行填写-设计稿图片" />')
        lines.append("\n\n")
        lines.append("# 使用指南")
        lines.append("\n\n")
        lines.append("## 参数")
        lines.append("\n\n")
        lines.append("|参数|类型|必要|默认值|说明|")
        lines.append("\n")
        lines.append("|---|---|:---:|---|---|")
        lines.append("\n")
        lines.append("|width|double|否|null|宽度|")
        lines.append("\n")
        lines.append("|**|**|**|**|**|")
        lines.append("\n")
        lines.append("|**|**|**|**|**|")
        lines.append("\n")
        lines.append("|**|**|**|**|**|")
        lines.append("\n\n")
        lines.append("## 使用示例")
        lines.append("\n\n")
        lines.append("```")
        lines.append("\n\n")
        lines.append("***")
        lines.append("\n")
        lines.append("***")
        lines.append("\n")
        lines.append("***")
        lines.append("\n\n")
        lines.append("```")
        lines.append("\n\n")
        lines.append("[【传送门】Dartpad - {widget} 演示](https://dartpad.dev/{gist})".format(widget=project_name, gist='请自行填写-gist代码地址'))
        lines.append("\n\n")
        lines.append('<iframe name="dartpad" width=90% height=1000 frameborder=0 src="https://dartpad.dev/请自行填写-gist代码地址"></iframe>')
        lines.append("\n\n")
        lines.append("# 历史版本")
        lines.append("\n\n")
        lines.append("[【传送门】组件历史版本](http://gitlab.alibaba-inc.com/fapi/{widget}/tags)".format(widget=project_name))
        lines.append("\n\n")

        readme.seek(0)
        readme.truncate()
        readme.writelines(lines)
        print(print_color(s="README.md 模版生成完成！", color='32'))


create_readme()
