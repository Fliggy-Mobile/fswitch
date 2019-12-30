import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fswitch/fswitch.dart';

void main() {
  const MethodChannel channel = MethodChannel('fswitch');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Fswitch.platformVersion, '42');
  });
}
