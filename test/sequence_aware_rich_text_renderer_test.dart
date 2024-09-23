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

  testWidgets('Render with 1 sequence', (WidgetTester tester) async {
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

  testWidgets('Render with 2 sequence', (WidgetTester tester) async {
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
                Sequence("World", style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),
        ),
      ),
    );

    final widget = tester
        .widget<SequenceAwareRichText>(find.byType(SequenceAwareRichText));
    expect(widget.text, "Hello World ₦");
    expect(key.currentState?.spanCount, 4);
  });

  test('Test Sequence toJson and fromJson', () {
    const sequence = Sequence(
      "₦",
      style: TextStyle(
        color: Colors.red,
        fontSize: 20,
        fontFamily: 'Roboto',
      ),
    );
    final json = sequence.toJson();
    final sequenceFromJson = Sequence.fromJson(json);

    expect(sequence.sequence, sequenceFromJson.sequence);
    expect(sequence.style?.color?.value, sequenceFromJson.style?.color?.value);
    expect(sequence.style?.fontSize, sequenceFromJson.style?.fontSize);
    expect(sequence.style?.fontFamily, sequenceFromJson.style?.fontFamily);
  });
}
