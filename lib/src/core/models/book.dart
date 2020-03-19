import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

@JsonSerializable()
class Book {
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;
  Book({this.firstName, this.lastName, this.dateOfBirth});
  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);
}
