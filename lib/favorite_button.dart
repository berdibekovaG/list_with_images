import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouriteWidget extends StatefulWidget {
  @override
  FavoriteWidgetState createState() => FavoriteWidgetState();
}

class FavoriteWidgetState extends State<FavouriteWidget> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
                splashRadius: 2,
                alignment: Alignment.centerLeft,
                icon: (_isFavorited
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border)),
                onPressed: _toggleFavorite,
                color: Colors.white,
              );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }
}
