Pod::Spec.new do |s|
  s.name             = 'APIVerveAnagramDetector'
  s.version          = '1.2.3'
  s.summary          = 'Anagram Detector checks whether two words or phrases are anagrams of each other.'
  s.description      = <<-'DESC'
Anagram Detector checks whether two words or phrases are anagrams of each other. Submit two strings to receive a true or false match verdict, cleaned comparison text, and character counts with options to ignore letter case and spaces.

This iOS/macOS SDK provides a convenient way to access the Anagram Detector from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/anagramdetector?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/anagramdetector-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveAnagramDetector/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
