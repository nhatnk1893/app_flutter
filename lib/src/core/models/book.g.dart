// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) {
  return Book(
    bookId: json['bookId'] as int,
    name: json['name'] as String,
    isComplete: json['isComplete'] as bool,
    thumnail: json['thumnail'] as String,
    chapters: json['chapters'] as int,
    description: json['description'] as String,
    startDate: json['startDate'] == null
        ? null
        : DateTime.parse(json['startDate'] as String),
    updateDate: json['updateDate'] == null
        ? null
        : DateTime.parse(json['updateDate'] as String),
    author: (json['author'] as List)
        ?.map((e) =>
            e == null ? null : Author.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    category: (json['category'] as List)
        ?.map((e) =>
            e == null ? null : Category.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    link: (json['link'] as List)
        ?.map(
            (e) => e == null ? null : Link.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'bookId': instance.bookId,
      'name': instance.name,
      'isComplete': instance.isComplete,
      'thumnail': instance.thumnail,
      'chapters': instance.chapters,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'author': instance.author,
      'category': instance.category,
      'link': instance.link,
    };
