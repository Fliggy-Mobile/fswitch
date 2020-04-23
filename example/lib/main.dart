import 'package:flutter/material.dart';

import 'package:fswitch/fswitch.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FSwitchPage(),
    );
  }
}

class FSwitchPage extends StatefulWidget {
  static const String routeName = '/fswitch';

  @override
  State<FSwitchPage> createState() => _FSwitchPageState();
}

class _FSwitchPageState extends State<FSwitchPage> {
  var enable_1 = true;
  var value_1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffc900),
        title: const Text('FSwitch'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            children: <Widget>[
              /// FSwitch
              buildTitle("FSwitch"),
              buildSmallMargin(),
              buildFSwitch(),
              buildSmallMargin(),
              buildDesc("一个简单的 FSwitch"),

              /// FSwitch with child
              buildTitle("FSwitch with child"),
              buildSmallMargin(),
              buildFSwitchWithChild(),
              buildSmallMargin(),
              buildDesc("FSwitch 支持自定义提示组件\n"
                  "通过 unselectedChild 和 selectedChild 属性"),
              _buildMiddleMargin(),

              /// Disable FSwitch
              buildTitle("Disable FSwitch"),
              buildSmallMargin(),
              buildDisableFSwitch(),
              buildDesc("通过 enable 属性可以设置 FSwitch 的可用状态"),
              _buildMiddleMargin(),

              /// Try Drag？
              buildTitle("Try Drag？"),
              buildSmallMargin(),
              buildDragFSwitch(),
              buildSmallMargin(),
              buildDesc("FSwitch 除了支持点击切换状态，也支持拖拽手势"),
            ],
          ),
        ),
      ),
    );
  }

  FSwitch buildDragFSwitch() {
    return FSwitch(
      width: 300,
      height: 38,
      onChanged: (bool value) {},
      sliderChild: Text(
        "😃",
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  StatefulBuilder buildDisableFSwitch() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: <Widget>[
            Text(
              enable_1 ? "可用状态" : "不可用状态",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            buildSmallMargin(),
            FSwitch(
              onChanged: (bool value) {
                value_1 = value;
              },
              open: value_1,
              enable: enable_1,
              shadowColor: Colors.black.withOpacity(0.5),
              shadowBlur: 3.0,
            ),
            buildSmallMargin(),
            RaisedButton(
              onPressed: () {
                setState(() {
                  enable_1 = !enable_1;
                });
              },
              child: Text("Toggle disable"),
              color: Color(0xffffc900),
            )
          ],
        );
      },
    );
  }

  Container buildFSwitchWithChild() {
    return Container(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FSwitch(
            width: 65.0,
            height: 35.538,
            onChanged: (v) {},
            closeChild: Text(
              "Off",
              style: TextStyle(color: Colors.white, fontSize: 11),
            ),
            openChild: Text(
              "On",
              style: TextStyle(color: Colors.white, fontSize: 11),
            ),
          ),
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
        ],
      ),
    );
  }

  FSwitch buildFSwitch() {
    return FSwitch(
      onChanged: (v) {},
    );
  }

  SizedBox _buildMiddleMargin() {
    return const SizedBox(
      height: 18,
    );
  }

  SizedBox buildSmallMargin() {
    return const SizedBox(
      height: 10,
    );
  }

  Padding buildDesc(String desc) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          desc,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ));
  }

  Container buildTitle(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(9),
      color: Color(0xffe0e0e0).withOpacity(0.38),
      child: Text(
        title,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
