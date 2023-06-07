// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:test_ambev/src/models/epub.dart';
import 'package:test_ambev/src/models/pdf.dart';

class AccessInfo {
  String? country;
  String? viewability;
  bool? embeddable;
  bool? publicDomain;
  String? textToSpeechPermission;
  Epub? epub;
  Pdf? pdf;
  String? webReaderLink;
  String? accessViewStatus;
  bool? quoteSharingAllowed;
  AccessInfo({
    this.country,
    this.viewability,
    this.embeddable,
    this.publicDomain,
    this.textToSpeechPermission,
    this.epub,
    this.pdf,
    this.webReaderLink,
    this.accessViewStatus,
    this.quoteSharingAllowed,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'country': country,
      'viewability': viewability,
      'embeddable': embeddable,
      'publicDomain': publicDomain,
      'textToSpeechPermission': textToSpeechPermission,
      'epub': epub?.toMap(),
      'pdf': pdf?.toMap(),
      'webReaderLink': webReaderLink,
      'accessViewStatus': accessViewStatus,
      'quoteSharingAllowed': quoteSharingAllowed,
    };
  }

  factory AccessInfo.fromMap(Map<String, dynamic> map) {
    return AccessInfo(
      country: map['country'] != null ? map['country'] as String : null,
      viewability: map['viewability'] != null ? map['viewability'] as String : null,
      embeddable: map['embeddable'] != null ? map['embeddable'] as bool : null,
      publicDomain: map['publicDomain'] != null ? map['publicDomain'] as bool : null,
      textToSpeechPermission: map['textToSpeechPermission'] != null ? map['textToSpeechPermission'] as String : null,
      epub: map['epub'] != null ? Epub.fromMap(map['epub'] as Map<String,dynamic>) : null,
      pdf: map['pdf'] != null ? Pdf.fromMap(map['pdf'] as Map<String,dynamic>) : null,
      webReaderLink: map['webReaderLink'] != null ? map['webReaderLink'] as String : null,
      accessViewStatus: map['accessViewStatus'] != null ? map['accessViewStatus'] as String : null,
      quoteSharingAllowed: map['quoteSharingAllowed'] != null ? map['quoteSharingAllowed'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccessInfo.fromJson(String source) => AccessInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
