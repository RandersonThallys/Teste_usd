// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:test_ambev/src/models/access_info.dart';
import 'package:test_ambev/src/models/sale_info.dart';
import 'package:test_ambev/src/models/search_info.dart';
import 'package:test_ambev/src/models/volume_info.dart';

class Book {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;
  Book({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kind': kind,
      'id': id,
      'etag': etag,
      'selfLink': selfLink,
      'volumeInfo': volumeInfo?.toMap(),
      'saleInfo': saleInfo?.toMap(),
      'accessInfo': accessInfo?.toMap(),
      'searchInfo': searchInfo?.toMap(),
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      kind: map['kind'] != null ? map['kind'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      etag: map['etag'] != null ? map['etag'] as String : null,
      selfLink: map['selfLink'] != null ? map['selfLink'] as String : null,
      volumeInfo: map['volumeInfo'] != null ? VolumeInfo.fromMap(map['volumeInfo'] as Map<String,dynamic>) : null,
      saleInfo: map['saleInfo'] != null ? SaleInfo.fromMap(map['saleInfo'] as Map<String,dynamic>) : null,
      accessInfo: map['accessInfo'] != null ? AccessInfo.fromMap(map['accessInfo'] as Map<String,dynamic>) : null,
      searchInfo: map['searchInfo'] != null ? SearchInfo.fromMap(map['searchInfo'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) => Book.fromMap(json.decode(source) as Map<String, dynamic>);
}
