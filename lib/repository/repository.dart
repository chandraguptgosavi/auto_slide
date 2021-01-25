import 'package:auto_slide/model/image_data.dart';
import 'package:auto_slide/network/auto_slide_api.dart';

class AutoSlideRepository{
  final AutoSlideClient autoSlideClient;

  AutoSlideRepository({this.autoSlideClient});

  Future<List<ImageData>> getImageData() async => await autoSlideClient.getImageData();
}