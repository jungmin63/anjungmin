// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:memo/main.dart';

void main() {
  testWidgets('Add note test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MemoApp());

    // Verify that no notes are initially displayed.
    expect(find.text('No notes'), findsOneWidget);

    // Tap the add note button and trigger a frame.
    await tester.tap(find.byKey(const Key('add_note_button')));
    await tester.pump();

    // Verify that the note input dialog is displayed.
    expect(find.byType(AlertDialog), findsOneWidget);

    // Enter a note in the text field and tap the add button.
    await tester.enterText(find.byType(TextField), 'Test note');
    await tester.tap(find.text('추가'));
    await tester.pump();

    // Verify that the note is added and displayed.
    expect(find.text('Test note'), findsOneWidget);
  });
}
