import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'listed_research_timeline_model.g.dart';

@JsonSerializable()
class ListedResearchimelineModel {
  bool show;
  String? name;
  String? date;
  bool status;
  ListedResearchimelineModel({
    this.show = false,
    this.name,
    this.date,
    this.status = false,
  });

  ListedResearchimelineModel copyWith({
    bool? show,
    String? name,
    String? date,
    bool? status,
  }) {
    return ListedResearchimelineModel(
      show: show ?? this.show,
      name: name ?? this.name,
      date: date ?? this.date,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() => _$ListedResearchimelineModelToJson(this);

  factory ListedResearchimelineModel.fromJson(Map<String, dynamic> json) =>
      _$ListedResearchimelineModelFromJson(json);

  @override
  String toString() {
    return 'ListedResearchimelineModel(show: $show, name: $name, date: $date, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ListedResearchimelineModel &&
        other.show == show &&
        other.name == name &&
        other.date == date &&
        other.status == status;
  }

  @override
  int get hashCode {
    return show.hashCode ^ name.hashCode ^ date.hashCode ^ status.hashCode;
  }
}
