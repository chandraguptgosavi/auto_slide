import 'package:auto_slide/bloc/bloc.dart';
import 'package:auto_slide/constants/strings.dart';
import 'package:auto_slide/model/image_data.dart';
import 'package:auto_slide/network/auto_slide_api.dart';
import 'package:auto_slide/repository/repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Bloc _bloc;
  final _dio = Dio();

  @override
  void initState() {
    super.initState();
    _bloc = Bloc(
      autoSlideRepository: AutoSlideRepository(
        autoSlideClient: AutoSlideClient(
          _dio,
        ),
      ),
    )..getImageData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AutoSlideString.app_name),
      ),
      body: Center(
        child: StreamBuilder<List<ImageData>>(
            stream: _bloc.imageDataStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CarouselSlider.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    var imageUrl = snapshot.data[index].downloadUrl;
                    return GestureDetector(
                      onTap: () {
                        _downloadStarted();
                        _bloc.downloadImage(_dio, imageUrl).then(
                            (Response response) => response.statusCode == 200
                                ? _downloadComplete()
                                : null);
                      },
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: imageUrl,
                        placeholder: (context, url) => Icon(Icons.warning),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2),
                    scrollDirection: Axis.horizontal,
                    enlargeCenterPage: true,
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  void _downloadStarted() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text(AutoSlideString.download_started),
      ),
    );
  }

  void _downloadComplete() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text(AutoSlideString.download_successful),
      ),
    );
  }

  @override
  void dispose(){
    _dio.close();
    _bloc.dispose();
    super.dispose();
  }
}
