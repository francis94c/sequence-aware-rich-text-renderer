# sequence-aware-rich-text-renderer

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A RichText widget that allows you to break-down and customize certain parts of its content as spans just by specifying the actual segment or characters you want styled differently.

## Features

- RichTextWidget.

## Getting started

Run

```bash
flutter pub add sequence-aware-rich-text-renderer
```

## Usage

The use case that inspired the creation of this package is about a problem with custom fonts that fail to support some characters like '₦' for example, but is supported by the native font being used by the application. I recon there are also other use cases where multiple font families have to be combined to produce some sort of visual effect.

Below is an example of how you'd typically use the widget this package provides, to solve the problem, or achieve what you have in mind.

This package was built with flexibility in mind and may be used beyond what I imagined it for.

Nevertheless, contributions are always welcome.

```dart
import 'package:sequence_aware_rich_text_renderer/sequence_aware_rich_text_renderer.dart';
.
.
.
const SequenceAwareRichText(
    "Please note that transactions below ₦5,000 will attract a service charge of ₦10, while transactions "
    "above ₦5,000 will attract a service charge of ₦25.",
    sequences: [
        Sequence(
        '₦',
        style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.red,
            ),
        ),
    ],
    style: TextStyle(
        color: Colors.black,
        fontFamily: 'DMSans',
    ),
);
```

## Additional information

PRs are welcome.
