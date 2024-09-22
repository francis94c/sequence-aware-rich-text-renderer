import 'package:flutter/material.dart';
import 'package:sequence_aware_rich_text_renderer/sequence.dart';

class SequenceAwareRichText extends StatefulWidget {
  final String text;
  final List<Sequence> sequences;

  const SequenceAwareRichText(
    this.text, {
    super.key,
    this.sequences = const [],
  });

  @override
  State<SequenceAwareRichText> createState() => _SequenceAwareRichTextState();
}

class _SequenceAwareRichTextState extends State<SequenceAwareRichText> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
