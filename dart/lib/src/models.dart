/// Response models for the Anagram Detector API.

/// API Response wrapper.
class AnagramdetectorResponse {
  final String status;
  final dynamic error;
  final AnagramdetectorData? data;

  AnagramdetectorResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory AnagramdetectorResponse.fromJson(Map<String, dynamic> json) => AnagramdetectorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? AnagramdetectorData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
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
  int? lengthText1;
  int? lengthText2;
  AnagramdetectorDataCharacterFrequencyText1? characterFrequencyText1;
  AnagramdetectorDataCharacterFrequencyText2? characterFrequencyText2;
  AnagramdetectorDataCommonCharacters? commonCharacters;
  AnagramdetectorDataUniqueToText1? uniqueToText1;
  AnagramdetectorDataUniqueToText2? uniqueToText2;
  int? similarityPercentage;
  AnagramdetectorDataOptions? options;

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
    this.characterFrequencyText1,
    this.characterFrequencyText2,
    this.commonCharacters,
    this.uniqueToText1,
    this.uniqueToText2,
    this.similarityPercentage,
    this.options,
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
      characterFrequencyText1: json['character_frequency_text1'] != null ? AnagramdetectorDataCharacterFrequencyText1.fromJson(json['character_frequency_text1']) : null,
      characterFrequencyText2: json['character_frequency_text2'] != null ? AnagramdetectorDataCharacterFrequencyText2.fromJson(json['character_frequency_text2']) : null,
      commonCharacters: json['common_characters'] != null ? AnagramdetectorDataCommonCharacters.fromJson(json['common_characters']) : null,
      uniqueToText1: json['unique_to_text1'] != null ? AnagramdetectorDataUniqueToText1.fromJson(json['unique_to_text1']) : null,
      uniqueToText2: json['unique_to_text2'] != null ? AnagramdetectorDataUniqueToText2.fromJson(json['unique_to_text2']) : null,
      similarityPercentage: json['similarity_percentage'],
      options: json['options'] != null ? AnagramdetectorDataOptions.fromJson(json['options']) : null,
    );
}

class AnagramdetectorDataCharacterFrequencyText1 {
  int? l;
  int? i;
  int? s;
  int? t;
  int? e;
  int? n;

  AnagramdetectorDataCharacterFrequencyText1({
    this.l,
    this.i,
    this.s,
    this.t,
    this.e,
    this.n,
  });

  factory AnagramdetectorDataCharacterFrequencyText1.fromJson(Map<String, dynamic> json) => AnagramdetectorDataCharacterFrequencyText1(
      l: json['l'],
      i: json['i'],
      s: json['s'],
      t: json['t'],
      e: json['e'],
      n: json['n'],
    );
}

class AnagramdetectorDataCharacterFrequencyText2 {
  int? s;
  int? i;
  int? l;
  int? e;
  int? n;
  int? t;

  AnagramdetectorDataCharacterFrequencyText2({
    this.s,
    this.i,
    this.l,
    this.e,
    this.n,
    this.t,
  });

  factory AnagramdetectorDataCharacterFrequencyText2.fromJson(Map<String, dynamic> json) => AnagramdetectorDataCharacterFrequencyText2(
      s: json['s'],
      i: json['i'],
      l: json['l'],
      e: json['e'],
      n: json['n'],
      t: json['t'],
    );
}

class AnagramdetectorDataCommonCharacters {
  int? l;
  int? i;
  int? s;
  int? t;
  int? e;
  int? n;

  AnagramdetectorDataCommonCharacters({
    this.l,
    this.i,
    this.s,
    this.t,
    this.e,
    this.n,
  });

  factory AnagramdetectorDataCommonCharacters.fromJson(Map<String, dynamic> json) => AnagramdetectorDataCommonCharacters(
      l: json['l'],
      i: json['i'],
      s: json['s'],
      t: json['t'],
      e: json['e'],
      n: json['n'],
    );
}

class AnagramdetectorDataUniqueToText1 {


  AnagramdetectorDataUniqueToText1({

  });

  factory AnagramdetectorDataUniqueToText1.fromJson(Map<String, dynamic> json) => AnagramdetectorDataUniqueToText1(

    );
}

class AnagramdetectorDataUniqueToText2 {


  AnagramdetectorDataUniqueToText2({

  });

  factory AnagramdetectorDataUniqueToText2.fromJson(Map<String, dynamic> json) => AnagramdetectorDataUniqueToText2(

    );
}

class AnagramdetectorDataOptions {
  bool? ignoreCase;
  bool? ignoreSpaces;

  AnagramdetectorDataOptions({
    this.ignoreCase,
    this.ignoreSpaces,
  });

  factory AnagramdetectorDataOptions.fromJson(Map<String, dynamic> json) => AnagramdetectorDataOptions(
      ignoreCase: json['ignore_case'],
      ignoreSpaces: json['ignore_spaces'],
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
