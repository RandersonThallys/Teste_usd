import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SearchInfo {
  String? textSnippet;
  SearchInfo({
    this.textSnippet,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'textSnippet': textSnippet,
    };
  }

  factory SearchInfo.fromMap(Map<String, dynamic> map) {
    return SearchInfo(
      textSnippet: map['textSnippet'] != null ? map['textSnippet'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchInfo.fromJson(String source) => SearchInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
