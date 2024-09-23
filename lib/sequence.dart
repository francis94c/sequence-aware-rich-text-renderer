import 'package:flutter/material.dart';

/// A class that represents a sequence of text to be styled.
class Sequence {
  /// The sequence of text to be styled. e.g. '₦', 'USD', 'EUR', 'GBP', 'The quick brown fox jumped over the lazy dog', etc.
  final String sequence;

  /// The style to apply to the sequence of text.
  final TextStyle? style;

  /// Creates a new instance of [Sequence].
  const Sequence(this.sequence, {this.style});
}
