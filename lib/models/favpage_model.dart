// import 'package:flutter/material.dart';
// import 'package:home_services_flutter/Detail_Screens/Baking_DetailScreen/Pizza_Detail.dart';
//
// import 'detail_model.dart';
//
//
//
// class FavouriteProductPage extends ChangeNotifier{
//
//   late PizzaDetailScreen _favoritelist;
//   final List<int> _itemIds = [];
//
//   PizzaDetailScreen get favoritelist => _favoritelist;
//
//
//   set favoritelist(PizzaDetailScreen newList) {
//     _favoritelist = newList;
//     notifyListeners();
//   }
//
//   //
//   List get items =>
//       _itemIds.map((id) => _favoritelist.getById(id)).toList();
//
//
//
//   void add(PizzaDetailScreen item) {
//     _itemIds.add(item.id);
//     notifyListeners();
//   }
//
//   void remove(PizzaDetailScreen item) {
//     _itemIds.remove(item.id);
//     notifyListeners();
//   }
// }