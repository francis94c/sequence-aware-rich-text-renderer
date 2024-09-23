import 'package:flutter/material.dart';

/// A class that represents a sequence of text to be styled.
class Sequence {
  /// The sequence of text to be styled. e.g. '₦', 'USD', 'EUR', 'GBP', 'The quick brown fox jumped over the lazy dog', etc.
  final String sequence;

  /// The style to apply to the sequence of text.
  final TextStyle? style;

  /// Creates a new instance of [Sequence].
  const Sequence(this.sequence, {this.style});

  /// Converts a JSON object to a [Sequence] instance.
  factory Sequence.fromJson(Map<String, dynamic> json) {
    return Sequence(
      json['sequence'] as String,
      style: json['style'] != null
          ? TextStyle(
              fontFamily: json['style']['font_family'],
              fontSize: json['style']['font_size'],
              fontWeight: json['style']['font_weight'] != null
                  ? FontWeight.values[json['style']['font_weight']]
                  : null,
              fontStyle: json['style']['font_style'] != null
                  ? FontStyle.values[json['style']['font_style']]
                  : null,
              color: json['style']['color'] != null
                  ? Color(json['style']['color'])
                  : null,
              backgroundColor: json['style']['background_color'] != null
                  ? Color(json['style']['background_color'])
                  : null,
              decoration: _stringToTextDecoration(json['style']['decoration']),
              decorationColor: json['style']['decoration_color'] != null
                  ? Color(json['style']['decoration_color'])
                  : null,
              decorationStyle: json['style']['decoration_style'] != null
                  ? TextDecorationStyle
                      .values[json['style']['decoration_style']]
                  : null,
              letterSpacing: json['style']['letter_spacing'],
              wordSpacing: json['style']['word_spacing'],
              height: json['style']['height'],
              locale: json['style']['locale'] != null
                  ? Locale(json['style']['locale'])
                  : null,
            )
          : null,
    );
  }

  /// Converts a [Sequence] instance to a JSON object.
  Map<String, dynamic> toJson() {
    return {
      'sequence': sequence,
      'style': style != null
          ? {
              'font_family': style!.fontFamily,
              'font_size': style!.fontSize,
              'font_weight': style!.fontWeight?.index,
              'font_style': style!.fontStyle?.index,
              'color': style!.color?.value,
              'background_color': style!.backgroundColor?.value,
              'decoration': _textDecorationToString(style!.decoration),
              'decoration_color': style!.decorationColor?.value,
              'decoration_style': style!.decorationStyle?.index,
              'letter_spacing': style!.letterSpacing,
              'word_spacing': style!.wordSpacing,
              'height': style!.height,
              'locale': style!.locale.toString(),
            }
          : null,
    };
  }

  /// Converts a String to TextDecoration.
  /// underline -> TextDecoration.underline
  /// line_through -> TextDecoration.lineThrough
  /// overline -> TextDecoration.overline
  /// none -> TextDecoration.none
  static TextDecoration? _stringToTextDecoration(String? value) {
    if (value?.isEmpty ?? true) {
      return null;
    }
    switch (value) {
      case 'underline':
        return TextDecoration.underline;
      case 'line_through':
        return TextDecoration.lineThrough;
      case 'overline':
        return TextDecoration.overline;
      default:
        return TextDecoration.none;
    }
  }

  /// Converts a TextDecoration to String.
  /// TextDecoration.underline -> 'underline'
  /// TextDecoration.lineThrough -> 'line_through'
  /// TextDecoration.overline -> 'overline'
  /// TextDecoration.none -> 'none'
  String _textDecorationToString(TextDecoration? value) {
    if (value == null) {
      return 'none';
    }
    switch (value) {
      case TextDecoration.underline:
        return 'underline';
      case TextDecoration.lineThrough:
        return 'line_through';
      case TextDecoration.overline:
        return 'overline';
      default:
        return 'none';
    }
  }
}
