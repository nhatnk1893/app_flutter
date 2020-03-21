import 'package:json_annotation/json_annotation.dart';
part 'book.g.dart';

@JsonSerializable()
class Book {
  final int bookId;
  final String name;
  final bool isComplete;
  final String thumnail;
  final int chapters;
  final String description;
  final DateTime startDate;
  final DateTime updateDate;
  final String author;

  Book(
      {this.bookId,
      this.name,
      this.isComplete,
      this.thumnail,
      this.chapters,
      this.description,
      this.startDate,
      this.updateDate,
      this.author});

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}
