# Anagram Detector API - Ruby Gem

Anagram Detector checks whether two words or phrases are anagrams of each other. Submit two strings to receive a true or false match verdict, cleaned comparison text, and character counts with options to ignore letter case and spaces.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_anagramdetector'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_anagramdetector
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_anagramdetector'

# Initialize the client
client = APIVerve::Anagramdetector::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  text1: "listen",
  text2: "silent",
  ignorecase: true,
  ignorespaces: true
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ text1: "listen", text2: "silent", ignorecase: true, ignorespaces: true })
  puts response["data"]
rescue APIVerve::Anagramdetector::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Anagramdetector::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Anagramdetector::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/anagramdetector?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/anagramdetector?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/anagramdetector?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
