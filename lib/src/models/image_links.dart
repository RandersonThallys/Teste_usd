import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;
  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'smallThumbnail': smallThumbnail,
      'thumbnail': thumbnail,
    };
  }

  factory ImageLinks.fromMap(Map<String, dynamic> map) {
    return ImageLinks(
      smallThumbnail:
          map['smallThumbnail'] != null ? map['smallThumbnail'] as String : '',
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageLinks.fromJson(String source) =>
      ImageLinks.fromMap(json.decode(source) as Map<String, dynamic>);
}
