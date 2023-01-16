import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:home_services_flutter/initialScreens/loginScreen.dart';


enum Categories { baking, cooking, knitting, tailoring, artAndCraft }

class SubcategoryScreen extends StatefulWidget {
  final Map<String, dynamic> categories;

  SubcategoryScreen({  required this.categories});

  @override
  _SubcategoryScreenState createState() => _SubcategoryScreenState();
}

class _SubcategoryScreenState extends State<SubcategoryScreen> {
  int _selectedIndex = 0;

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('Category');

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
  String getAppbarTitle() => "Sub category ${widget.categories['name']}";

  @override
  Widget build(BuildContext context) {
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
            child: ListView.builder(
              itemCount: widget.categories['subcategories'].length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final subcategory = widget.categories['subcategories'][index];
                return ListTile(

                  trailing: Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: Colors.black,
                  ),
                  title: Text(
                      subcategory['name'].toString() ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    // if (index == 0) {
                    //   if (data['name'] == "Tailoring") {
                    //     Text(data['subcategories'].toString());
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) =>
                    //                 SellerPortfolio()));
                    //   }
                    // } else if (index == 1) {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => LoginScreen()));
                    // }
                  },
                );

              },
            )),
      ),
    );
  }
}
