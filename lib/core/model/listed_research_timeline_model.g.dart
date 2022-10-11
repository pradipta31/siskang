// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listed_research_timeline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListedResearchimelineModel _$ListedResearchimelineModelFromJson(
        Map<String, dynamic> json) =>
    ListedResearchimelineModel(
      show: json['show'] as bool? ?? false,
      name: json['name'] as String?,
      date: json['date'] as String?,
      status: json['status'] as bool? ?? false,
    );

Map<String, dynamic> _$ListedResearchimelineModelToJson(
        ListedResearchimelineModel instance) =>
    <String, dynamic>{
      'show': instance.show,
      'name': instance.name,
      'date': instance.date,
      'status': instance.status,
    };
