<p align="center">
  <a href="https://github.com/Fliggy-Android-Team">
    <img width="200" src="https://gw.alicdn.com/tfs/TB1a288sxD1gK0jSZFKXXcJrVXa-360-360.png">
  </a>
</p>

<h1 align="center">FSwitch</h1>


<div align="center">

<p>An interesting and practical switch component.</p>

<p>Supports setting tips, slider decorations, shadows, and good interaction.</p>

<p><strong>Author：<a href="https://github.com/chenBingX">Newton</a>(<a href="coorchice.cb@alibaba-inc.com">coorchice.cb@alibaba-inc.com</a>)</strong></p>

<p>

<a href="https://pub.dev/packages/fswitch#-readme-tab-">
    <img height="20" src="https://img.shields.io/badge/Version-1.1.0-important.svg">
</a>


<a href="https://github.com/Fliggy-Android-Team/fswitch">
    <img height="20" src="https://img.shields.io/badge/Build-passing-brightgreen.svg">
</a>


<a href="https://github.com/Fliggy-Android-Team">
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

**English | [简体中文](https://github.com/Fliggy-Android-Team/fswitch/blob/master/README_CN.md)**

> Like it? Please cast your **Star**  🥰 ！

# ✨ Features

- Support opening and closing tips

- Support setting decoration for **Slider**

- Support flexible configuration available state

- More sense of space **Shadow**

- Good switch interactive experience

# 🛠 Guide

## ⚙️ Parameters

|Param|Type|Necessary|Default|desc|
|---|---|:---:|---|---|
|open|bool|false|false|Whether it is open. The default is false.|
|onChanged|ValueChanged<bool>|true|null|This function will be called back when the switch state changes.|
|width|double|false|59.23|width. Default 59.23, in line with aesthetics 😃|
|height|double|false|null|height. By default, it will be calculated according to [width], which is in line with aesthetics 😃|
|offset|double|false|null|Distance between slider and edge|
|openChild|Widget|false|null|Prompt style of open state|
|closeChild|Widget|false|null|Prompt style of closed state|
|childOffset|double|false|null|Tip to edge distance|
|color|Color|false|null|Background color when off|
|openColor|Color|false|null|Background color when open|
|sliderColor|Color|false|null|Slider color|
|enable|bool|false|true|it's usable or not|
|sliderChild|Widget|false|null|The component in the slider. Beyond the range will be cropped.|
|shadowColor|Color|false|null|Set component shadow color|
|shadowOffset|Offset|false|null|Set component shadow offset|
|shadowBlur|double|false|0.0|Set the standard deviation of the component Gaussian and shadow shape convolution|

## 📺 Demo

### 🔩 Basic Demo

![](https://raw.githubusercontent.com/chenBingX/img/master/Flutter/fswitch/fswitch_normal.gif)

```dart
FSwitch(
  onChanged: (v) {},
)
```

**FSwitch** needs to always set `onChanged` in order to respond to the switch status.

### Available status & shadow

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

You can change the available status of **FSwitch** through `enable`. Once **FSwitch** becomes available, the switch state cannot be changed. 

In addition, **FSwitch** provides flexible and convenient shadow configuration support.

### 🌝 Prompt

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

The open and closed status indicators can be set for **FSwitch** through `openChild` and` closeChild`, respectively.


### 👀 Slider decoration

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

`sliderChild` will allow developers to set` child` decorations for **Slider**.

It's interesting!


# 😃 How to use？

Add dependencies in the project `pubspec.yaml` file:

## 🌐 pub dependency

```
dependencies:
  fswitch: ^<version number>
```

> ⚠️ Attention，please go to [**pub**](https://pub.dev/packages/fswitch) to get the latest version number of **FSwitch**

## 🖥 git dependencies

```
dependencies:
  fswitch:
    git:
      url: 'git@github.com:Fliggy-Android-Team/fswitch.git'
      ref: '<Branch number or tag number>'
```


> ⚠️ Attention，please refer to [**FSwitch**](https://github.com/Fliggy-Android-Team/fswitch) official project for branch number or tag.


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


### Like it? Please cast your [**Star**](https://github.com/Fliggy-Android-Team/fswitch) 🥰 ！

