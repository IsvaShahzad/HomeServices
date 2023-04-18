import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Services with ChangeNotifier {
  final String id;
  final String productname;
  final String productdescription;
  final double productprice;
  final String imageUrl;
  final  tile;



  bool isFavourite;


  Services(    {

    required this.id,
    required this.productname,
    required this.productdescription,
    required this.productprice,
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