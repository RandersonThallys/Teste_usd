// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:test_ambev/src/models/book.dart';

class Volumes {
  String? kind;
  int? totalItems;
  List<Book>? items;
  Volumes({this.kind, this.totalItems, items}) {
    if (items == null) {
      this.items = [];
    } else {
      this.items = items;
    }
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kind': kind,
      'totalItems': totalItems,
      'items': items != null ? items!.map((x) => x.toMap()).toList() : null,
    };
  }

  factory Volumes.fromMap(Map<String, dynamic> map) {
    return Volumes(
      kind: map['kind'] != null ? map['kind'] as String : null,
      totalItems: map['totalItems'] != null ? map['totalItems'] as int : null,
      items: map['items'] != null
          ? List<Book>.from(
              (map['items'] as List).map<Book?>(
                (x) => Book.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Volumes.fromJson(String source) =>
      Volumes.fromMap(json.decode(source) as Map<String, dynamic>);
}
