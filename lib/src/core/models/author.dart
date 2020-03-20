import 'package:json_annotation/json_annotation.dart';
part 'author.g.dart';

@JsonSerializable()
class Author {
  final String name;
  final String urlAvatar;

  Author(this.name, this.urlAvatar);

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
