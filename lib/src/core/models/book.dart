import 'package:app_flutter/src/core/models/author.dart';
import 'package:app_flutter/src/core/models/category.dart';
import 'package:app_flutter/src/core/models/link.dart';
import 'package:json_annotation/json_annotation.dart';
part 'book.g.dart';

@JsonSerializable()
class Book {
  final int bookId;
  final String name;
  final bool isComplete;
  final String thumnail;
  final int chapters;
  final String author;
  final String description;
  final DateTime startDate;
  final DateTime updateDate;

  Book(this.bookId, this.name, this.isComplete, this.thumnail, this.chapters,
      this.author, this.description, this.startDate, this.updateDate);

  // final List<Author> author;
  // final List<Category> category;
  // final List<Link> link;

  // Book(
  //     this.bookId,
  //     this.name,
  //     this.isComplete,
  //     this.thumnail,
  //     this.chapters,
  //     this.description,
  //     this.startDate,
  //     this.updateDate,
  //     this.author,
  //     this.category,
  //     this.link);

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}
