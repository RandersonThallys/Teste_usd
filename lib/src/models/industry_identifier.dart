import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class IndustryIdentifier {
  String? type;
  String? identifier;
  IndustryIdentifier({
    this.type,
    this.identifier,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'identifier': identifier,
    };
  }

  factory IndustryIdentifier.fromMap(Map<String, dynamic> map) {
    return IndustryIdentifier(
      type: map['type'] != null ? map['type'] as String : null,
      identifier: map['identifier'] != null ? map['identifier'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory IndustryIdentifier.fromJson(String source) => IndustryIdentifier.fromMap(json.decode(source) as Map<String, dynamic>);
}
