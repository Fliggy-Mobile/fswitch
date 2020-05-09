<p align="center">
  <a href="https://github.com/Fliggy-Mobile">
    <img width="200" src="https://gw.alicdn.com/tfs/TB1a288sxD1gK0jSZFKXXcJrVXa-360-360.png">
  </a>
</p>

<h1 align="center">FSwitch</h1>


<div align="center">

<p>一个有趣的、实用的开关组件。</p>

<p>支持设置提示、滑块装饰、阴影以及良好的交互。</p>

<p><strong>主理人：<a href="https://github.com/chenBingX">纽特</a>(<a href="coorchice.cb@alibaba-inc.com">coorchice.cb@alibaba-inc.com</a>)</strong></p>

<p>

<a href="https://pub.dev/packages/fswitch#-readme-tab-">
    <img height="20" src="https://img.shields.io/badge/Version-1.1.2-important.svg">
</a>


<a href="https://github.com/Fliggy-Mobile/fswitch">
    <img height="20" src="https://img.shields.io/badge/Build-passing-brightgreen.svg">
</a>


<a href="https://github.com/Fliggy-Mobile">
    <img height="20" src="https://img.shields.io/badge/Team-FAT-ffc900.svg">
</a>

<a href="https://www.dartcn.com/">
    <img height="20" src="https://img.shields.io/badge/Language-Dart-blue.svg">
</a>

<a href="https://pub.dev/documentation/fswitch/latest/fswitch/fswitch-library.html">
    <img height="20" src="https://img.shields.io/badge/API-done-yellowgreen.svg">
</a>

<a href="http://www.apache.org/licenses/LICENSE-2.0.txt">
   <img height="20" src="https://img.shields.io/badge/License-Apache--2.0-blueviolet.svg">
</a>

<p>
<p>

<img height="500" src="https://raw.githubusercontent.com/chenBingX/img/master/Flutter/fswitch/fswitch_all.png">

</div>

**[English](https://github.com/Fliggy-Mobile/fswitch) | 简体中文**

> 感觉还不错？请投出您的 **Star** 吧 🥰 ！

# ✨ 特性

- 支持打开、关闭的提示

- 支持为 **Slider** 设置装饰

- 支持灵活的配置可用状态

- 更具空间感的 **阴影**

- 良好的开关交互体验

# 🛠 使用指南


## ⚙️ 参数

|参数|类型|必要|默认值|说明|
|---|---|:---:|---|---|
|open|bool|否|false|是否处于打开状态。默认 false。|
|onChanged|ValueChanged<bool>|是|null|当开关状态发生改变时，会回调该函数。|
|width|double|否|59.23|宽度。默认 59.23，符合美学 😃|
|height|double|否|null|高度。默认会根据 [width] 进行计算，符合美学 😃|
|offset|double|否|null|滑块与边缘的间距|
|openChild|Widget|否|null|打开状态的提示样式|
|closeChild|Widget|否|null|关闭状态的提示样式|
|childOffset|double|否|null|提示与边缘的间距|
|color|Color|否|null|关闭状态下的背景色|
|openColor|Color|否|null|打开状态下的背景色|
|sliderColor|Color|否|null|滑块颜色|
|enable|bool|否|true|是否可用|
|sliderChild|Widget|否|null|滑块中的组件。超过范围会被剪裁。|
|shadowColor|Color|否|null|设置组件阴影颜色|
|shadowOffset|Offset|否|null|设置组件阴影偏移|
|shadowBlur|double|否|0.0|设置组件高斯与阴影形状卷积的标准偏差|

## 📺 使用示例

### 🔩 基本使用

![](https://raw.githubusercontent.com/chenBingX/img/master/Flutter/fswitch/fswitch_normal.gif)

```dart
FSwitch(
  onChanged: (v) {},
)
```

**FSwitch** 需要始终设置 `onChanged`，以便根据开关状态作出响应。

### 可用状态 & 阴影

![](https://raw.githubusercontent.com/chenBingX/img/master/Flutter/fswitch/fswitch_enable_shadow.gif)

```dart
FSwitch(
  onChanged: (bool value) {
    value_1 = value;
  },
  open: value_1,
  enable: enable_1,
  shadowColor: Colors.black.withOpacity(0.5),
  shadowBlur: 3.0,
),
```

通过 `enable` 可以改变 **FSwitch** 的可用状态。一旦 **FSwitch** 变为可用状态，将无法再改变开关状态。

此外，**FSwitch** 提供了灵活便捷的阴影配置支持。

### 🌝 提示

![](https://raw.githubusercontent.com/chenBingX/img/master/Flutter/fswitch/fswitch_tip.gif)

```dart

/// #1
FSwitch(
  width: 65.0,
  height: 35.538,
  onChanged: (v) {},
  closeChild: Text(
    "Off",
    style: TextStyle(
        color: Colors.white, fontSize: 11),
  ),
  openChild: Text(
    "On",
    style: TextStyle(
        color: Colors.white, fontSize: 11),
  ),
),

/// #2
FSwitch(
  open: true,
  onChanged: (v) {},
  closeChild: Icon(
    Icons.close,
    size: 16,
    color: Colors.white,
  ),
  openChild: Icon(
    Icons.check,
    size: 16,
    color: Colors.white,
  ),
),

/// #3
FSwitch(
  width: 65.0,
  height: 35.538,
  onChanged: (v) {},
  closeChild: Text(
    "😒",
    style: TextStyle(fontSize: 20),
  ),
  openChild: Text(
    "😃",
    style: TextStyle(fontSize: 20),
  ),
  childOffset: 3.0,
),
```

通过 `openChild` 和 `closeChild` 可以分别为 **FSwitch** 设置打开、关闭的状态指示。


### 👀 Slider 装饰

![](https://raw.githubusercontent.com/chenBingX/img/master/Flutter/fswitch/fswitch_slider.gif)

```dart
FSwitch(
  width: 300,
  height: 38,
  onChanged: (bool value) {},
  sliderChild: Text(
    "😃",
    style: TextStyle(fontSize: 20),
  ),
)
```

`sliderChild` 将允许开发者为 **Slider** 设置 `child` 装饰。

这很有趣！

# 😃 如何使用？

在项目 `pubspec.yaml` 文件中添加依赖：

## 🌐 pub 依赖方式

```
dependencies:
  fswitch: ^<版本号>
```

> ⚠️ 注意，请到 [**pub**](https://pub.dev/packages/fswitch) 获取 **FSwitch** 最新版本号

## 🖥 git 依赖方式

```
dependencies:
  fswitch:
    git:
      url: 'git@github.com:Fliggy-Mobile/fswitch.git'
      ref: '<分支号 或 tag>'
```


> ⚠️ 注意，分支号 或 tag 请以 [**FSwitch**](https://github.com/Fliggy-Mobile/fswitch) 官方项目为准。


# 💡 License

```
Copyright 2020-present Fliggy Android Team <alitrip_android@list.alibaba-inc.com>.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at following link.

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

```


### 感觉还不错？请投出您的 [**Star**](https://github.com/Fliggy-Mobile/fswitch) 吧 🥰 ！

