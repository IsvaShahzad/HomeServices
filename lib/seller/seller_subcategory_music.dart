import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_flutter/seller/SellerProfilePage.dart';
import 'package:home_services_flutter/initialScreens/loginScreen.dart';
import 'package:home_services_flutter/seller/addProduct.dart';
import 'package:home_services_flutter/seller/consumerSignup.dart';
import 'package:home_services_flutter/categories_seller/SellerCategories.dart';
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
    // if (index == 1) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => AddProduct()),
    //   );
    // } else if (index == 2) {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => SellerPortfolio()));
    // }
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
                  ListView.builder(
                    itemCount: data['subcategories']
                        .where((subCategory) => subCategory['name'] == 'Music')
                        .length,
                    itemBuilder: (context, index) {
                      final subCategory = data['subcategories']
                          .where((subCategory) => subCategory['name'] == 'Music')
                          .toList()[index];
                      return ListTile(
                        title: Text(subCategory['name']),
                        // other properties
                      );
                    },
                  );

                  return Column(
                    children: [
                      ListTile(
                        //
                        //           title: Text(
                        //
                        // data['name'] == "Music" ? data['subcategories'].toString() : "",
                        //
                        //             // data['subcategories'].toString(),   //CHANGE WILL OCCUR HERE
                        //
                        //             style: TextStyle(
                        //               fontWeight: FontWeight.bold,
                        //             ),
                        // ),

                        trailing: Container(

                          width: 310,
                          child: Column(


                            children: [
                              // data['subcategories']
                              //     .where((subCategory) => subCategory['name'] == 'Music')
                              //     .map((subCategory) => ListTile(
                              //   title: Text(subCategory['name']),
                              //   // other properties
                              // )
                              // ).toList()




                              // for (var i = 0; i < data['subcategories'].length; i++)
                              //   Expanded(
                              //     child: ListTile(
                              //       title: Text(data['subcategories'][i]['name']),
                              //
                              //       onTap: (){},
                              //     ),
                              //   ),
                                  ],
                                ),
                              ),

                  // for (var i = 0;
                  //                 i < data['subcategories'].length;
                  //                 i++)
                  //                 ...List.from(data['subcategories']
                  //                     .where((subCategory) =>
                  //                         subCategory['name'] == 'Music')
                  //                     .map(
                  //                   (subCategory) => ListTile(
                  //                       // title: Text(subCategory['name']),
                  //
                  //                       title: Text(
                  //                           data['subcategories'][i]['name']),
                  //                       onTap: () {
                  //                         if (i == 0) {
                  //                           if (data['name'] == "Music") {
                  //                             Text(data['subcategories']
                  //                                 .toString());
                  //                             Navigator.push(
                  //                                 context,
                  //                                 MaterialPageRoute(
                  //                                     builder: (context) =>
                  //                                         SellerPortfolio()));
                  //                           }
                  //                         } else if (i == 1) {
                  //                           Navigator.push(
                  //                               context,
                  //                               MaterialPageRoute(
                  //                                   builder: (context) =>
                  //                                       AddProduct()));
                  //                         }
                  //                       }),
                  //                   onTap: () {
                  //                     // navigate to the appropriate page
                  //                   },
                  //                 ))
                  //               ]),
                  //         ),
                  //       ),
                        // subtitle: Text(data['subcategories'].toString()),
                      // Divider(),
                  )]);
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
