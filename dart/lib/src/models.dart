/// Response models for the Anagram Detector API.

/// API Response wrapper.
class AnagramdetectorResponse {
  final String status;
  final dynamic error;
  final AnagramdetectorData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  AnagramdetectorResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory AnagramdetectorResponse.fromJson(Map<String, dynamic> json) => AnagramdetectorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? AnagramdetectorData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Anagram Detector API.

class AnagramdetectorData {
  String? text1;
  String? text2;
  bool? isAnagram;
  String? cleanedText1;
  String? cleanedText2;
  String? sortedText1;
  String? sortedText2;
  num? lengthText1;
  num? lengthText2;
  num? similarityPercentage;

  AnagramdetectorData({
    this.text1,
    this.text2,
    this.isAnagram,
    this.cleanedText1,
    this.cleanedText2,
    this.sortedText1,
    this.sortedText2,
    this.lengthText1,
    this.lengthText2,
    this.similarityPercentage,
  });

  factory AnagramdetectorData.fromJson(Map<String, dynamic> json) => AnagramdetectorData(
      text1: json['text1'],
      text2: json['text2'],
      isAnagram: json['is_anagram'],
      cleanedText1: json['cleaned_text1'],
      cleanedText2: json['cleaned_text2'],
      sortedText1: json['sorted_text1'],
      sortedText2: json['sorted_text2'],
      lengthText1: json['length_text1'],
      lengthText2: json['length_text2'],
      similarityPercentage: json['similarity_percentage'],
    );
}

class AnagramdetectorRequest {
  String text1;
  String text2;
  bool? ignorecase;
  bool? ignorespaces;

  AnagramdetectorRequest({
    required this.text1,
    required this.text2,
    this.ignorecase,
    this.ignorespaces,
  });

  Map<String, dynamic> toJson() => {
      'text1': text1,
      'text2': text2,
      if (ignorecase != null) 'ignorecase': ignorecase,
      if (ignorespaces != null) 'ignorespaces': ignorespaces,
    };
}
