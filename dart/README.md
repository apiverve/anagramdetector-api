# Anagram Detector API - Dart/Flutter Client

Anagram Detector checks whether two words or phrases are anagrams of each other. Submit two strings to receive a true or false match verdict, cleaned comparison text, and character counts with options to ignore letter case and spaces.

[![pub package](https://img.shields.io/pub/v/apiverve_anagramdetector.svg)](https://pub.dev/packages/apiverve_anagramdetector)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Anagram Detector API](https://apiverve.com/marketplace/anagramdetector?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_anagramdetector: ^1.2.3
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
    "similarity_percentage": 100
  }
}
```

## API Reference

- **API Home:** [Anagram Detector API](https://apiverve.com/marketplace/anagramdetector?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/anagramdetector](https://docs.apiverve.com/ref/anagramdetector?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
