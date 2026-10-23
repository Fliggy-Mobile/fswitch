import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fswitch/fswitch.dart';

void main() {
  testWidgets('FSwitch renders and toggles on tap', (WidgetTester tester) async {
    bool? changed;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: FSwitch(
              onChanged: (bool value) => changed = value,
            ),
          ),
        ),
      ),
    );

    final Finder switchFinder = find.byType(FSwitch);
    expect(switchFinder, findsOneWidget);
    expect(tester.widget<FSwitch>(switchFinder).open, isFalse);

    await tester.tap(switchFinder);
    await tester.pumpAndSettle();

    expect(tester.widget<FSwitch>(switchFinder).open, isTrue);
    expect(changed, isTrue);
  });
}
