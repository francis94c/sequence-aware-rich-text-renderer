import 'package:flutter/material.dart';
import 'package:sequence_aware_rich_text_renderer/sequence_aware_rich_text_renderer.dart';

/// SequenceAwareRichText Widget.
class SequenceAwareRichText extends StatefulWidget {
  /// The text to render be style by provided sequence.
  final String text;

  /// The list of sequences to style.
  final List<Sequence> sequences;

  /// The global or root style, equivalent to the top level TextSpan style of a RichText widget.
  final TextStyle? style;

  /// Creates a new instance of [SequenceAwareRichText] widget.
  const SequenceAwareRichText(
    this.text, {
    super.key,
    this.style,
    this.sequences = const [],
  });

  @override
  State<SequenceAwareRichText> createState() => SequenceAwareRichTextState();
}

/// State class for [SequenceAwareRichText].
class SequenceAwareRichTextState extends State<SequenceAwareRichText> {
  List<TextSpan> _spans = [];

  /// The number of spans in the RichText widget after the text has been analyzed.
  @visibleForTesting
  int get spanCount => _spans.length;

  @override
  void initState() {
    super.initState();

    Iterable<Match> matches;

    if (widget.sequences.isEmpty) {
      _spans.add(TextSpan(text: widget.text));
      return;
    }

    for (var sequence in widget.sequences) {
      if (_spans.isEmpty) {
        matches = RegExp(sequence.sequence).allMatches(widget.text);
        if (matches.isNotEmpty) {
          _spans = _processSequence(sequence, widget.text, matches);
        }
      } else {
        List<TextSpan> tempSpans = [];
        for (var x = 0; x < _spans.length; x++) {
          matches = RegExp(sequence.sequence).allMatches(_spans[x].text!);
          if (matches.isNotEmpty) {
            tempSpans
                .addAll(_processSequence(sequence, _spans[x].text!, matches));
          } else {
            tempSpans.add(_spans[x]);
          }
        }
        _spans = tempSpans;
      }
    }
  }

  List<TextSpan> _processSequence(
      Sequence sequence, String text, Iterable<Match> matches,
      {Sequence? parentSequence}) {
    List<TextSpan> spans = [];
    for (var x = 0; x < matches.length; x++) {
      if (matches.first.start == matches.elementAt(x).start) {
        spans.add(TextSpan(
          text: text.substring(0, matches.elementAt(x).start),
          style: parentSequence?.style,
        ));
      }
      spans.add(TextSpan(
        text: text.substring(
            matches.elementAt(x).start, matches.elementAt(x).end),
        style: sequence.style,
      ));
      if (x + 1 <= matches.length - 1) {
        spans.add(
          TextSpan(
            text: text.substring(
                matches.elementAt(x).end, matches.elementAt(x + 1).start),
            style: parentSequence?.style,
          ),
        );
      } else if (matches.elementAt(x).end < text.length) {
        spans.add(
          TextSpan(
            text: text.substring(matches.elementAt(x).end),
            style: parentSequence?.style,
          ),
        );
      }
    }
    return spans;
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: _spans,
        style: widget.style,
      ),
    );
  }
}
