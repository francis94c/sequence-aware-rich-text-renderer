import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sequence_aware_rich_text_renderer/sequence_aware_rich_text_renderer.dart';

void main() {
  testWidgets('adds one to input values', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
      body: Center(
        child: SequenceAwareRichText(""),
      ),
    )));
  });
}
