import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PanelizationSummary {
  bool? containsEpubBubbles;
  bool? containsImageBubbles;
  PanelizationSummary({
    this.containsEpubBubbles,
    this.containsImageBubbles,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'containsEpubBubbles': containsEpubBubbles,
      'containsImageBubbles': containsImageBubbles,
    };
  }

  factory PanelizationSummary.fromMap(Map<String, dynamic> map) {
    return PanelizationSummary(
      containsEpubBubbles: map['containsEpubBubbles'] != null ? map['containsEpubBubbles'] as bool : null,
      containsImageBubbles: map['containsImageBubbles'] != null ? map['containsImageBubbles'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PanelizationSummary.fromJson(String source) => PanelizationSummary.fromMap(json.decode(source) as Map<String, dynamic>);
}
