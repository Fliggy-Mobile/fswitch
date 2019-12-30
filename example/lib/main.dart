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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Builder(
            builder: (context) => Container(
                  padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                  child: Column(
                    children: <Widget>[
                      Divider(
                        height: 0.5,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(height: 9),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '默认未选中 - 默认样式',
                            style: TextStyle(color: Colors.grey),
                          ),
                          FSwitch(
                            value: false,
                            onChanged: (v) {
                              // do something
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 9),
                      Divider(
                        height: 0.5,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(height: 9),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '默认选中 - 默认样式',
                            style: TextStyle(color: Colors.grey),
                          ),
                          FSwitch(
                            value: true,
                            onChanged: (v) {},
                          )
                        ],
                      ),
                      const SizedBox(height: 9),
                      Divider(
                        height: 0.5,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(height: 9),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '不可用状态 - 默认未选中 - 默认样式',
                            style: TextStyle(color: Colors.grey),
                          ),
                          FSwitch(
                            value: false,
                            onChanged: (v) {},
                            enable: false,
                          )
                        ],
                      ),
                      const SizedBox(height: 9),
                      Divider(
                        height: 0.5,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(height: 9),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '不可用状态 - 默认选中 - 默认样式',
                            style: TextStyle(color: Colors.grey),
                          ),
                          FSwitch(
                            value: true,
                            onChanged: (v) {},
                            enable: false,
                          )
                        ],
                      ),
                      const SizedBox(height: 9),
                      Divider(
                        height: 0.5,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(height: 9),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '默认未选中 - 自定义样式',
                            style: TextStyle(color: Colors.grey),
                          ),
                          FSwitch(
                            width: 90,
                            height: 36,
                            value: false,
                            onChanged: (v) {},
                            text: 'OFF',
                            selectedText: 'ON',
                            color: Color(0xffffc900),
                            backgroundColor: Colors.blueAccent,
                            selectedBackgroundColor: Colors.black,
                          )
                        ],
                      ),
                      const SizedBox(height: 9),
                      Divider(
                        height: 0.5,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(height: 9),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '默认选中 - 自定义样式',
                            style: TextStyle(color: Colors.grey),
                          ),
                          FSwitch(
                            width: 90,
                            height: 36,
                            value: true,
                            onChanged: (v) {},
                            text: 'OFF',
                            selectedText: 'ON',
                            color: Color(0xffffc900),
                            backgroundColor: Colors.blueAccent,
                            selectedBackgroundColor: Colors.black,
                          )
                        ],
                      ),
                      const SizedBox(height: 9),
                      Divider(
                        height: 0.5,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(height: 9),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '不可用状态 - 默认未选中 - 自定义样式',
                            style: TextStyle(color: Colors.grey),
                          ),
                          FSwitch(
                            width: 90,
                            height: 36,
                            value: false,
                            enable: false,
                            onChanged: (v) {},
                            text: 'OFF',
                            selectedText: 'ON',
                            color: Color(0xffffc900),
                            backgroundColor: Colors.blueAccent,
                            selectedBackgroundColor: Colors.black,
                          )
                        ],
                      ),
                      const SizedBox(height: 9),
                      Divider(
                        height: 0.5,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(height: 9),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '不可用状态 - 默认选中 - 自定义样式',
                            style: TextStyle(color: Colors.grey),
                          ),
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
                        ],
                      ),
                      const SizedBox(height: 9),
                      Divider(
                        height: 0.5,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(height: 9),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '拖拽试试？',
                            style: TextStyle(color: Colors.grey),
                          ),
                          FSwitch(
                            width: 250,
                            height: 30,
                            value: false,
                            onChanged: (v) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text("Current state is：" +
                                    (v ? "True" : "False")),
                                duration: Duration(milliseconds: 800),
                              ));
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
