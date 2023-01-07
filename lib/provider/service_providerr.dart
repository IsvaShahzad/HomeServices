
import 'package:flutter/material.dart';
import 'package:home_services_flutter/initialScreens/loginScreen.dart';
import 'package:home_services_flutter/provider/Services.dart';







class Service with ChangeNotifier {




  List<Services> _items = [


    Services(
      id: 'p1',
      title: 'Cooking',
      description: 'Yummy food served hot and fresh!',
      price: 29.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV-oD00DlqKrdThqP6BW7FD0EU416kQooCHg&usqp=CAU',
      tile: ListTile(
        title: Text(
          'Chowmein',
        ),
        subtitle: Text("Chinese Cuisine "),
        trailing: Container(
          height: 80,
          width: 80,
          alignment: Alignment.center,
          child: Image(image: AssetImage('assets/images/chowmein.png')),
        ),
      ),


    ),
    Services(
      id: 'p2',
      title: 'Arts and Crafts',
      description: 'Fun art for your homes',
      price: 59.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoPBpcQ232xzzI9zse9KfloKXqJ6teE28T8Q&usqp=CAU',
      tile: ListTile(
        title: Text(
          'Mirror',
        ),
        subtitle: Text("Hand crafted mirror with side embellishments  "),
        trailing: Container(
          height: 80,
          width: 80,
          alignment: Alignment.center,
          child: Image(image: AssetImage('assets/images/mirror.png')),


        ),
  //
  // onTap: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => ChowmeinScreen()),
  //             );
  //           }
    ),



    ),
    Services(
      id: 'p3',
      title: 'Tailoring',
      description: 'We provide with the best tailoring service.',
      price: 19.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRe4vtX_RSXWN5cqR6ezJ1S4EUbi9A__I1h_A&usqp=CAU',
      tile: ListTile(
        title: Text(
          'tailor',
        ),
        subtitle: Text("Chinese Cuisine "),
        trailing: Container(
          height: 80,
          width: 80,
          alignment: Alignment.center,
          child: Image(image: AssetImage('assets/images/chowmein.png')),
        ),
      ),

    ),


    Services(
      id: 'p4',
      title: 'Knitting',
      description: 'Knitting services available',
      price: 49.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgDpHZP0OzjPK5iJMC7JuLnuQRsZe-1RQN1A&usqp=CAU',
      tile: ListTile(
        title: Text(
          'knit',
        ),
        subtitle: Text("Chinese Cuisine "),
        trailing: Container(
          height: 80,
          width: 80,
          alignment: Alignment.center,
          child: Image(image: AssetImage('assets/images/chowmein.png')),
        ),
      ),

    ),

    Services(
      id: 'p5',
      title: 'Baking',
      description: 'Taste the best baked goods!',
      price: 89.99,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUqjkfBk9PPjy6LWNkhYCxqPY8E8XUmw-Hpw&usqp=CAU',
      tile: ListTile(
        title: Text(
          'bake',
        ),
        subtitle: Text("Chinese Cuisine "),
        trailing: Container(
          height: 80,
          width: 80,
          alignment: Alignment.center,
          child: Image(image: AssetImage('assets/images/chowmein.png')),
        ),
      ),

    ),
  ]; //private items underscore

  List<Services> get items {
    return [..._items];
  }

  Services findById(String id) {
    return _items.firstWhere((serv) => serv.id == id);
  }

  void addService() {
    // _items.add(value);
    notifyListeners();
  }
}
