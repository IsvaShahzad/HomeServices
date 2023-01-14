import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_flutter/seller/SellerProfilePage.dart';
import 'package:home_services_flutter/initialScreens/loginScreen.dart';
import 'package:home_services_flutter/seller/addProduct.dart';
import 'package:home_services_flutter/seller/consumerSignup.dart';
import 'package:home_services_flutter/seller/SellerCategories.dart';
import 'package:home_services_flutter/seller/seller_portfolio.dart';

class subcategoryScreen extends StatefulWidget {
  @override
  _subcategoryScreenState createState() => _subcategoryScreenState();
}

class _subcategoryScreenState extends State<subcategoryScreen> {
  int _selectedIndex = 0;

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('Category');

  late Stream<QuerySnapshot> _streamCategory = _collectionRef.snapshots();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddProduct()),
      );
    } else if (index == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SellerPortfolio()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamCategory = _collectionRef.snapshots();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            "sub Categories",
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
          IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SellerHomePage()));
              }),
        ],
      ),



      body: Padding(
        padding: EdgeInsets.only(top: 30),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection('Category').snapshots(),
          builder: (_, snapshot) {
            if (snapshot.hasError) return Text('Error = ${snapshot.error}');

            if (snapshot.hasData) {
              final docs = snapshot.data!.docs;
              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (_, i) {
                  final data = docs[i].data();
                  return Column(
                    children: [
                      ListTile(
                          title: Text(
                            data['subcategories'].toString(),
                            // // Text(data['subcategories'].toString());

                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                  ),

                          // subtitle: Text(data['subcategories'].toString()),
                          onTap: () {
                            // // Text(data['subcategories'].toString());
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => SellerPortfolio(),
                            //     ));
                            if (i == 0) {
                              if (data['name'] == "music") {
                                Text(data['subcategories'].toString());
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SellerPortfolio()));
                              }} else if (i == 1) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddProduct()));
                              }
                            }),
                      Divider(),
                    ],
                  );
                },
              );
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),




    );
  }
}
