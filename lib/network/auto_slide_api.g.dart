// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_slide_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AutoSlideClient implements AutoSlideClient {
  _AutoSlideClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://picsum.photos/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<ImageData>> getImageData() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/v2/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => ImageData.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
