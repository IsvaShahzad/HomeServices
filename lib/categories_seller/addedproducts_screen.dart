import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:home_services_flutter/initialScreens/loginScreen.dart';

enum Addedproducts { image, description, name, price }

class ProductsAddedScreen extends StatefulWidget {
  final Map<String, dynamic> added;

  ProductsAddedScreen({required this.added});

  @override
  _ProductsAddedScreenState createState() => _ProductsAddedScreenState();
}

class _ProductsAddedScreenState extends State<ProductsAddedScreen> {
  int _selectedIndex = 0;

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('addproducts');

  late Stream<QuerySnapshot> _streamCategory = _collectionRef.snapshots();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamCategory = _collectionRef.snapshots();
  }

  //
  // String getAppbarTitle() => "Add products ${widget.added['product price']}";
  String getAppbarTitle() => "Add products";

  @override
  Widget build(BuildContext context) {
    final productPrice = widget.added?["product price"];
    final productName = widget.added?["product name"];
    final productDescription = widget.added?["product description"];

    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/pastel.png"),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 7,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
            title: Align(
              alignment: Alignment.center,
              child: Text(
                getAppbarTitle(),
                style: TextStyle(color: Colors.white),
              ),
            ),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 30),
            child: GridView.builder(
              itemCount: 1,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final addedproductss = widget.added?[index];
                return Card(
                  child: Column(
                    children: <Widget>[
                      // Image.network(addedproductss["Image URl"]),
                      Text(
                        "${productName} - ${productPrice} - ${productDescription}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ));
  }
}
