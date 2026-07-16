# Anagram Detector API - PHP Package

Anagram Detector is a tool for checking if two words or phrases are anagrams of each other. It provides character frequency analysis and similarity scoring.

## Installation

Install via Composer:

```bash
composer require apiverve/anagramdetector
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Anagramdetector\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'text1' => 'listen',
    'text2' => 'silent',
    'ignorecase' => true,
    'ignorespaces' => true
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Anagramdetector\Client;
use APIVerve\Anagramdetector\Exceptions\APIException;
use APIVerve\Anagramdetector\Exceptions\ValidationException;

try {
    $response = $client->execute(['text1' => 'listen', 'text2' => 'silent', 'ignorecase' => true, 'ignorespaces' => true]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/anagramdetector?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://apiverve.com/marketplace/anagramdetector?utm_source=php&utm_medium=readme](https://apiverve.com/marketplace/anagramdetector?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
