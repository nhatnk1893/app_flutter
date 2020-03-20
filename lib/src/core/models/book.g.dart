// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) {
  return Book(
    json['bookId'] as int,
    json['name'] as String,
    json['isComplete'] as bool,
    json['thumnail'] as String,
    json['chapters'] as int,
    json['author'] as String,
    json['description'] as String,
    json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
    json['updateDate'] == null
        ? null
        : DateTime.parse(json['updateDate'] as String),
  );
}

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'bookId': instance.bookId,
      'name': instance.name,
      'isComplete': instance.isComplete,
      'thumnail': instance.thumnail,
      'chapters': instance.chapters,
      'author': instance.author,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
    };
