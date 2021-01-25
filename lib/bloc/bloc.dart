import 'dart:async';

import 'package:auto_slide/constants/strings.dart';
import 'package:auto_slide/model/image_data.dart';
import 'package:auto_slide/repository/repository.dart';
import 'package:auto_slide/utils/permission.dart';
import 'package:dio/dio.dart';

class Bloc{
  final AutoSlideRepository autoSlideRepository;
  final StreamController<List<ImageData>> _imageDataController = StreamController();
  Stream<List<ImageData>> get imageDataStream => _imageDataController.stream;

  Bloc({this.autoSlideRepository}){
    StoragePermission.checkPermission();
  }

  Future<void> getImageData() async {
    var imageData = await autoSlideRepository.getImageData();
    _imageDataController.add(imageData);
  }
  
  Future<Response<dynamic>> downloadImage(Dio dio, String imageUrl) async {
    return await dio.download(imageUrl, AutoSlideString.download_path);
  }

  void dispose(){
    _imageDataController.close();
  }
}