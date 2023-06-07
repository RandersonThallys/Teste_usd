import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReadingMode {
  bool? text;
  bool? image;
  ReadingMode({
    this.text,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'image': image,
    };
  }

  factory ReadingMode.fromMap(Map<String, dynamic> map) {
    return ReadingMode(
      text: map['text'] != null ? map['text'] as bool : null,
      image: map['image'] != null ? map['image'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReadingMode.fromJson(String source) => ReadingMode.fromMap(json.decode(source) as Map<String, dynamic>);
}
