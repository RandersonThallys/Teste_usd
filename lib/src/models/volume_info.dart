// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:test_ambev/src/models/image_links.dart';
import 'package:test_ambev/src/models/industry_identifier.dart';
import 'package:test_ambev/src/models/panelization_summary.dart';
import 'package:test_ambev/src/models/reading_mode.dart';

class VolumeInfo {
  String? title;
  String? subtitle;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifier>? industryIdentifiers;
  ReadingMode? readingModes;
  int? pageCount;
  String? printType;
  List<String>? categories;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;
  VolumeInfo({
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'authors': authors,
      'publisher': publisher,
      'publishedDate': publishedDate,
      'description': description,
      'industryIdentifiers': industryIdentifiers != null
          ? industryIdentifiers!.map((x) => x.toMap()).toList()
          : null,
      'readingModes': readingModes?.toMap(),
      'pageCount': pageCount,
      'printType': printType,
      'categories': categories,
      'maturityRating': maturityRating,
      'allowAnonLogging': allowAnonLogging,
      'contentVersion': contentVersion,
      'panelizationSummary': panelizationSummary?.toMap(),
      'imageLinks': imageLinks?.toMap(),
      'language': language,
      'previewLink': previewLink,
      'infoLink': infoLink,
      'canonicalVolumeLink': canonicalVolumeLink,
    };
  }

  factory VolumeInfo.fromMap(Map<String, dynamic> map) {
    return VolumeInfo(
      title: map['title'] != null ? map['title'] as String : '',
      subtitle: map['subtitle'] != null ? map['subtitle'] as String : '',
      authors:
          map['authors'] != null ? List.from((map['authors'] as List)) : [],
      publisher: map['publisher'] != null ? map['publisher'] as String : '',
      publishedDate:
          map['publishedDate'] != null ? map['publishedDate'] as String : '',
      description:
          map['description'] != null ? map['description'] as String : '',
      industryIdentifiers: map['industryIdentifiers'] != null
          ? List<IndustryIdentifier>.from(
              (map['industryIdentifiers'] as List).map<IndustryIdentifier?>(
                (x) => IndustryIdentifier.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
      readingModes: map['readingModes'] != null
          ? ReadingMode.fromMap(map['readingModes'] as Map<String, dynamic>)
          : null,
      pageCount: map['pageCount'] != null ? map['pageCount'] as int : 0,
      printType: map['printType'] != null ? map['printType'] as String : '',
      categories: map['categories'] != null
          ? List.from((map['categories'] as List))
          : [],
      maturityRating:
          map['maturityRating'] != null ? map['maturityRating'] as String : '',
      allowAnonLogging: map['allowAnonLogging'] != null
          ? map['allowAnonLogging'] as bool
          : null,
      contentVersion:
          map['contentVersion'] != null ? map['contentVersion'] as String : '',
      panelizationSummary: map['panelizationSummary'] != null
          ? PanelizationSummary.fromMap(
              map['panelizationSummary'] as Map<String, dynamic>)
          : null,
      imageLinks: map['imageLinks'] != null
          ? ImageLinks.fromMap(map['imageLinks'] as Map<String, dynamic>)
          : null,
      language: map['language'] != null ? map['language'] as String : '',
      previewLink:
          map['previewLink'] != null ? map['previewLink'] as String : '',
      infoLink: map['infoLink'] != null ? map['infoLink'] as String : '',
      canonicalVolumeLink: map['canonicalVolumeLink'] != null
          ? map['canonicalVolumeLink'] as String
          : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VolumeInfo.fromJson(String source) =>
      VolumeInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
