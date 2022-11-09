import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker/common_widgets/custom_raised_button.dart';

void main() {
  testWidgets('onPressed callback', (WidgetTester tester) async {
    var pressed = false;
    await tester.pumpWidget(
      MaterialApp(
        home: CustomRaisedButton(
          child: Text('tap me'),
          onPressed: () => pressed = true,
        ),
      ),
    );
    final button = find.byType(ElevatedButton);
    expect(button, findsOneWidget);
    expect(find.byType(TextButton), findsNothing);
    expect(find.text('tap me'), findsOneWidget);
    await tester.tap(button); // use always await when calling tester methods
    expect(pressed, true);
  });
}
