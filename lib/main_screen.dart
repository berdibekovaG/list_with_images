import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'favorite_button.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildImageList(context),
    );
  }

  List data = [];
  List imgUrl = [];
  bool isShowImage = false;

  @override
  void initState() {
    super.initState();
    _getImages();
  }

  _assign() {
    for (var i = 0; i < data.length; i++) {
      imgUrl.add(data.elementAt(i)["urls"]["small"]);
    }
  }

  Future<String> _getImages() async {
    var client = Uri.parse(
        'https://api.unsplash.com/photos/?per_page=30&client_id=w6yze840PI-JjK6rhMXnjsBy-4qHHePX2JObu99xGGU');
    http.Response response = await http.get(client);
    setState(() {
      data = json.decode(response.body);
      isShowImage = true;
      return _assign();
    });
  }

  _buildImageList(context) {
    return ListView.builder(
      itemCount: imgUrl.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _buildPhotoAndCard(isShowImage
            ? Image.network(imgUrl.elementAt(index), fit: BoxFit.fitWidth)
            : CircularProgressIndicator);
      },
    );
  }

  _buildPhotoAndCard(photo) => Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: photo,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Card(child: FavouriteWidget()),
              ),
            ],
          ),
        ],
      );
}
