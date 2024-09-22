import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sequence_aware_rich_text_renderer/sequence_aware_rich_text_renderer.dart';

void main() {
  testWidgets('Render without sequence', (WidgetTester tester) async {
    final key = GlobalKey<SequenceAwareRichTextState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: SequenceAwareRichText(
              "Hello World ₦",
              key: key,
            ),
          ),
        ),
      ),
    );

    final widget = tester
        .widget<SequenceAwareRichText>(find.byType(SequenceAwareRichText));
    expect(widget.text, "Hello World ₦");
    expect(key.currentState?.spanCount, 1);
  });

  testWidgets('Render with sequence', (WidgetTester tester) async {
    final key = GlobalKey<SequenceAwareRichTextState>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: SequenceAwareRichText(
              "Hello World ₦",
              key: key,
              sequences: const [
                Sequence("₦", style: TextStyle(color: Colors.red)),
              ],
            ),
          ),
        ),
      ),
    );

    final widget = tester
        .widget<SequenceAwareRichText>(find.byType(SequenceAwareRichText));
    expect(widget.text, "Hello World ₦");
    expect(key.currentState?.spanCount, 2);
  });
}
