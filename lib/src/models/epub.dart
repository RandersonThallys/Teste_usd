import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Epub {
  bool? isAvailable;
  Epub({
    this.isAvailable,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isAvailable': isAvailable,
    };
  }

  factory Epub.fromMap(Map<String, dynamic> map) {
    return Epub(
      isAvailable: map['isAvailable'] != null ? map['isAvailable'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Epub.fromJson(String source) => Epub.fromMap(json.decode(source) as Map<String, dynamic>);
}
