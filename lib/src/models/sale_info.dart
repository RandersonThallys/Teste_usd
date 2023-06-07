import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SaleInfo {
  String? country;
  String? saleability;
  bool? isEbook;
  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'saleability': saleability,
      'isEbook': isEbook,
    };
  }

  factory SaleInfo.fromMap(Map<String, dynamic> map) {
    return SaleInfo(
      country: map['country'] != null ? map['country'] as String : null,
      saleability: map['saleability'] != null ? map['saleability'] as String : null,
      isEbook: map['isEbook'] != null ? map['isEbook'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SaleInfo.fromJson(String source) => SaleInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
