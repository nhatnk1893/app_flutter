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
    json['chapters'] as int,
    json['description'] as String,
    json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
    json['updateDate'] == null
        ? null
        : DateTime.parse(json['updateDate'] as String),
    (json['author'] as List)
        ?.map((e) =>
            e == null ? null : Author.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['category'] as List)
        ?.map((e) =>
            e == null ? null : Category.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['link'] as List)
        ?.map(
            (e) => e == null ? null : Link.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'bookId': instance.bookId,
      'name': instance.name,
      'isComplete': instance.isComplete,
      'chapters': instance.chapters,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'author': instance.author,
      'category': instance.category,
      'link': instance.link,
    };
