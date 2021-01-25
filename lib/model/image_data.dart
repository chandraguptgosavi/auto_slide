import 'package:json_annotation/json_annotation.dart';

part 'image_data.g.dart';

@JsonSerializable()
class ImageData{
  final String id;
  final String author;
  final int width;
  final int height;
  final String url;
  @JsonKey(name: 'download_url')
  final String downloadUrl;

  ImageData({this.id, this.author, this.width, this.height, this.url, this.downloadUrl});

  factory ImageData.fromJson(Map<String, dynamic> json) => _$ImageDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDataToJson(this);
}