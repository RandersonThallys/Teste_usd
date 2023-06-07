import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Pdf {
  bool? isAvailable;
  String? acsTokenLink;
  Pdf({
    this.isAvailable,
    this.acsTokenLink,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isAvailable': isAvailable,
      'acsTokenLink': acsTokenLink,
    };
  }

  factory Pdf.fromMap(Map<String, dynamic> map) {
    return Pdf(
      isAvailable: map['isAvailable'] != null ? map['isAvailable'] as bool : null,
      acsTokenLink: map['acsTokenLink'] != null ? map['acsTokenLink'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pdf.fromJson(String source) => Pdf.fromMap(json.decode(source) as Map<String, dynamic>);
}
