# fswitch

# fapi/fswitch

![](https://badgen.net/badge/tnpm/0.1.0/blue)

> [使用前请参考【Flutter组件开发使用文档】](https://yuque.antfin-inc.com/hummingbird/flutter-guide/sv9shr)

* 主理人：纽特 <coorchice.cb@alibaba-inc.com>

# 设计规范

<img src="https://gtms02.alicdn.com/tfs/TB1Wj7ARVXXXXawXXXXXXXXXXXX-1604-636.png" />

# 使用指南

一个灵活的 Switch 组件。

## 参数

|参数|类型|必要|默认值|说明|
|---|---|:---:|---|---|
|value|bool|是|false|是否是选中状态|
|onChanged|ValueChanged<bool>|是|null|选中状态改变时的回调|
|width|double|否|59.23|宽度|
|height|double|否|null|高度|
|offset|double|否|null|滑块与边缘的间距|
|textOffset|double|否|null|文本与边缘的间距|
|textColor|Color|否|Colors.white|未选中状态下的文本颜色|
|selectedTextColor|Color|否|Colors.white|选中状态下的文本颜色|
|textSize|double|否|null|文本字号|
|text|String|否|null|未选中状态下文本|
|selectedText|String|否|null|选中状态下文本|
|backgroundColor|Color|否|null|未选中状态下背颜色|
|selectedBackgroundColor|Color|否|null|选中状态下背颜色|
|color|Color|否|null|滑块颜色|
|enable|bool|否|true|是否可用|

## 使用示例

```

FSwitch(
  width: 90,
  height: 36,
  value: true,
  enable: false,
  onChanged: (v) {
    // do something
  },
  text: 'OFF',
  selectedText: 'ON',
  color: Color(0xffffc900),
  backgroundColor: Colors.blueAccent,
  selectedBackgroundColor: Colors.black,
)

```

[【传送门】Dartpad - fswitch 演示](https://dartpad.dev/1211f991c90c1448528afa763173c6fe)

<iframe name="dartpad" width=90% height=1000 frameborder=0 src="https://dartpad.dev/1211f991c90c1448528afa763173c6fe"></iframe>

# 历史版本

[【传送门】组件历史版本](http://gitlab.alibaba-inc.com/fapi/fswitch/tags)

