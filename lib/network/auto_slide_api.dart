import 'package:auto_slide/constants/strings.dart';
import 'package:auto_slide/model/image_data.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'auto_slide_api.g.dart';

@RestApi(baseUrl: AutoSlideString.base_url)
abstract class AutoSlideClient{
  factory AutoSlideClient(Dio dio) = _AutoSlideClient;

  @GET('/v2/list')
  Future<List<ImageData>> getImageData();
}