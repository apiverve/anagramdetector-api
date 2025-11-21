# Anagram Detector API

> Anagram Detector is a tool for checking if two words or phrases are anagrams of each other. It provides character frequency analysis and similarity scoring.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![API Status](https://img.shields.io/badge/Status-Active-green.svg)](https://apiverve.com)
[![Method](https://img.shields.io/badge/Method-GET-blue.svg)](#)
[![Platform](https://img.shields.io/badge/Platform-Multi--Platform-orange.svg)](#installation)

**Available on:**
[![npm](https://img.shields.io/badge/npm-CB3837?style=flat&logo=npm&logoColor=white)](https://www.npmjs.com/package/@apiverve/anagramdetector)
[![NuGet](https://img.shields.io/badge/NuGet-004880?style=flat&logo=nuget&logoColor=white)](https://www.nuget.org/packages/APIVerve.API.AnagramDetector)
[![PyPI](https://img.shields.io/badge/PyPI-3776AB?style=flat&logo=python&logoColor=white)](https://pypi.org/project/apiverve-anagramdetector/)
[![CocoaPods](https://img.shields.io/badge/CocoaPods-EE3322?style=flat&logo=cocoapods&logoColor=white)](#-cocoapods-iosmacos)
[![JitPack](https://img.shields.io/badge/JitPack-2E7D32?style=flat&logo=android&logoColor=white)](#-android-jitpack)

---

## Quick Start

### Using JavaScript

```javascript
async function callAnagramDetectorAPI() {
    try {
        const params &#x3D; new URLSearchParams({
            text1: &#x27;listen&#x27;,
            text2: &#x27;silent&#x27;,
            ignorecase: true,
            ignorespaces: true
        });

        const response = await fetch(&#x60;https://api.apiverve.com/v1/anagramdetector?${params}&#x60;, {
            method: 'GET',
            headers: {
                'x-api-key': 'YOUR_API_KEY_HERE'
            }
        });

        const data = await response.json();
        console.log(data);
    } catch (error) {
        console.error('Error:', error);
    }
}

callAnagramDetectorAPI();
```

### Using cURL

```bash
curl -X GET "https://api.apiverve.com/v1/anagramdetector?param=value" \
  -H "x-api-key: YOUR_API_KEY_HERE"
```

**Get your API key:** [https://apiverve.com](https://apiverve.com)

**📁 For more examples, see the [examples folder](./examples/)**

---

## Installation

Choose your preferred programming language:

### 📦 NPM (JavaScript/Node.js)

```bash
npm install @apiverve/anagramdetector
```

[**View NPM Package →**](https://www.npmjs.com/package/@apiverve/anagramdetector) | [**Package Code →**](./npm/)

---

### 🔷 NuGet (.NET/C#)

```bash
dotnet add package APIVerve.API.AnagramDetector
```

[**View NuGet Package →**](https://www.nuget.org/packages/APIVerve.API.AnagramDetector) | [**Package Code →**](./nuget/)

---

### 🐍 Python (PyPI)

```bash
pip install apiverve-anagramdetector
```

[**View PyPI Package →**](https://pypi.org/project/apiverve-anagramdetector/) | [**Package Code →**](./python/)

---

### 🍎 CocoaPods (iOS/macOS)

```ruby
pod 'APIVerveAnagramDetector', '~> 1.0'
```

[**Package Code →**](./cocoapods/)

---

### 🤖 Android (JitPack)

```gradle
implementation 'com.github.apiverve:anagramdetector-api:1.0.0'
```

[**Package Code →**](./android/)

---

## Features

✅ **Multi-platform support** - Use the same API across Node.js, .NET, Python, iOS/macOS, Android, and browsers
✅ **Simple authentication** - Just add your API key in the request header
✅ **Comprehensive documentation** - Full examples and API reference available
✅ **Production-ready** - Used by developers worldwide

---

## Documentation

📚 **Full API Documentation:** [https://docs.apiverve.com/ref/anagramdetector](https://docs.apiverve.com/ref/anagramdetector)

---

## Use Cases

Common use cases for the Anagram Detector API:

- ✅ Integration into web applications
- ✅ Mobile app development
- ✅ Data analysis and reporting
- ✅ Automation workflows
- ✅ Microservices architecture

---

## API Reference

### Authentication
All requests require an API key in the header:
```
x-api-key: YOUR_API_KEY_HERE
```

Get your API key: [https://apiverve.com](https://apiverve.com)

### Response Format
All responses are JSON with this structure:
```json
{
  "status": "ok",
  "data": { ... }
}
```

---

## Support & Community

- 💬 **Support**: [https://apiverve.com/contact](https://apiverve.com/contact)
- 🐛 **Issues**: [GitHub Issues](../../issues)
- 📖 **Documentation**: [https://docs.apiverve.com](https://docs.apiverve.com)
- 🌐 **Website**: [https://apiverve.com](https://apiverve.com)

---

## Contributing

We welcome contributions! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

---

## Security

For security concerns, please review our [Security Policy](SECURITY.md).

---

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

Built with ❤️ by [APIVerve](https://apiverve.com)

Copyright © 2025 APIVerve. All rights reserved.
