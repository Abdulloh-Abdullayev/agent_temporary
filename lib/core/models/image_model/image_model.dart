import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
@embedded
class Image {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "path")
  String? path;
  @JsonKey(name: "client_id")
  String? clientId;

  Image({this.id, this.name, this.path, this.clientId});

  factory Image.fromJson(Map<String, dynamic> data) => _$ImageFromJson(data);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
