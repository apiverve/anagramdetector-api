# Anagram Detector API - Dart/Flutter Client

Anagram Detector is a tool for checking if two words or phrases are anagrams of each other. It provides character frequency analysis and similarity scoring.

[![pub package](https://img.shields.io/pub/v/apiverve_anagramdetector.svg)](https://pub.dev/packages/apiverve_anagramdetector)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Anagram Detector API](https://apiverve.com/marketplace/anagramdetector?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_anagramdetector: ^1.1.13
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_anagramdetector/apiverve_anagramdetector.dart';

void main() async {
  final client = AnagramdetectorClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'text1': 'listen',
      'text2': 'silent',
      'ignorecase': true,
      'ignorespaces': true
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "text1": "listen",
    "text2": "silent",
    "is_anagram": true,
    "cleaned_text1": "listen",
    "cleaned_text2": "silent",
    "sorted_text1": "eilnst",
    "sorted_text2": "eilnst",
    "length_text1": 6,
    "length_text2": 6,
    "character_frequency_text1": {
      "l": 1,
      "i": 1,
      "s": 1,
      "t": 1,
      "e": 1,
      "n": 1
    },
    "character_frequency_text2": {
      "s": 1,
      "i": 1,
      "l": 1,
      "e": 1,
      "n": 1,
      "t": 1
    },
    "common_characters": {
      "l": 1,
      "i": 1,
      "s": 1,
      "t": 1,
      "e": 1,
      "n": 1
    },
    "unique_to_text1": {},
    "unique_to_text2": {},
    "similarity_percentage": 100,
    "options": {
      "ignore_case": true,
      "ignore_spaces": true
    }
  }
}
```

## API Reference

- **API Home:** [Anagram Detector API](https://apiverve.com/marketplace/anagramdetector?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/anagramdetector](https://docs.apiverve.com/ref/anagramdetector?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)
