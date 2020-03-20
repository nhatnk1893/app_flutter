import 'package:json_annotation/json_annotation.dart';
part 'link.g.dart';

@JsonSerializable()
class Link {
  final int id;
  final String urlChapter;

  Link(this.id, this.urlChapter);

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
  Map<String, dynamic> toJson() => _$LinkToJson(this);
}
