import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/list_tile.dart';

class Services with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final  tile;



  bool isFavourite;


  Services(    {

    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.tile,






    this.isFavourite = false,

  });

  void toggleFavouriteStatus()
  {

    isFavourite = !isFavourite;
    notifyListeners();
  }

}