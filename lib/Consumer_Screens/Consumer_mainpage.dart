import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_flutter/Consumer_Screens/Consumer_Profile.dart';
import 'package:home_services_flutter/Consumer_Screens/add_requirements_consumer.dart';
import 'package:home_services_flutter/Consumer_Screens/added_postings.dart';
import 'package:home_services_flutter/Consumer_Screens/cart_screen.dart';
import 'package:home_services_flutter/Consumer_Screens/explore_consumer_screen.dart';
import 'package:home_services_flutter/main.dart';
import 'package:home_services_flutter/models/favpage_model.dart';
import 'package:home_services_flutter/provider/provider.dart';
import 'package:home_services_flutter/screens/favpage_screen.dart';
import 'package:home_services_flutter/seller/SellerProfilePage.dart';
import 'package:home_services_flutter/initialScreens/loginScreen.dart';
import 'package:home_services_flutter/seller/seller_portfolio.dart';
import 'package:home_services_flutter/seller/sellerwelcome.dart';
import 'package:home_services_flutter/seller/signupSeller.dart';
import 'package:provider/provider.dart';
import '../Categories/subcategory_screen.dart';
import '../Consumer_Screens/consumerSignup.dart';
import '../seller/addProduct.dart';
import 'favourites.dart';

class ConsumerMainPageScreen extends StatefulWidget {
  //
  // late final String ImageURL;
  // late final String productName;
  // late final String productPrice;
  // late final String productDescription;
  //
  // ConsumerMainPageScreen({required this.ImageURL,
  //   required this.productDescription,
  //   required this.productPrice,
  //   required this.productName
  // }); // Up
  @override
  _ConsumerMainPageScreenState createState() => _ConsumerMainPageScreenState();
}

class _ConsumerMainPageScreenState extends State<ConsumerMainPageScreen> {
  int _selectedIndex = 0;
  bool _onFavoritePage = false;

  // late final  FavouriteProductPage model = add ;

  // final FavoriteProductsPage _favoriteProductsModel = FavoriteProductsPage(model: FavouriteProductPage);

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('Category');

  late Stream<QuerySnapshot> _streamCategory = _collectionRef.snapshots();

  // void navigateToFavoriteProductsPage() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => FavoriteProductsPage(
  //         model: Provider.of<FavouriteProductPage>(context),
  //         ImageURL: product.ImageURL,
  //         productName: product.productName,
  //         productPrice: product.productPrice,
  //         productDescription: product.productDescription,
  //       ),
  //     ),
  //   );
  // }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      _onFavoritePage = false;

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Cart_Screen()),
      );
    } else if (index == 2) {
      _onFavoritePage = true;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FavoriteProductsPage(
            model: Provider.of<FavouriteProductPage>(context),
            ImageURL: product.ImageURL,
            productName: product.productName,
            productPrice: product.productPrice,
            productDescription: product.productDescription,
          ),
        ),
      );
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
    final favouriteProductsModel =
        Provider.of<FavouriteProductPage>(context, listen: false);

    return Consumer<FavouriteProductPage>(
        builder: (context, favouriteProductPage, child) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/pastel.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 13,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
            title: Align(
              alignment: Alignment.center,
              child: Text(
                "Browse Category",
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
            padding: EdgeInsets.only(top: 80),
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream:
                  FirebaseFirestore.instance.collection('Category').snapshots(),
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
                            tileColor: Colors.white24,

                            trailing: Icon(
                              Icons.arrow_forward,
                              size: 20,
                              color: Colors.black,
                            ),
                            leading: data['name'] == "Tailoring"
                                ? Image(
                                    image: AssetImage(
                                        'assets/images/tailoring.png'),
                                    width: 80.0,
                                    height: 70.0,
                                  )
                                : data['name'] == "Knitting"
                                    ? Image(
                                        image: AssetImage(
                                            'assets/images/knittingpic.png'),
                                        width: 80.0,
                                        height: 70.0,
                                      )
                                    : data['name'] == "Baking"
                                        ? Image(
                                            image: AssetImage(
                                                'assets/images/baking.png'),
                                            width: 80.0,
                                            height: 70.0,
                                          )
                                        : data['name'] == "Cooking"
                                            ? Image(
                                                image: AssetImage(
                                                    'assets/images/cooking.png'),
                                                width: 80.0,
                                                height: 70.0,
                                              )
                                            : data['name'] == "Arts & Crafts "
                                                ? Image(
                                                    image: AssetImage(
                                                        'assets/images/ac.png'),
                                                  )
                                                : Image(
                                                    image: AssetImage(
                                                        'assets/images/ac.png'),
                                                  ),
                            title: Text(
                              data['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // subtitle: Text(data['subcategories'].toString()),
                            onTap: () {
                              print("i am calling tap ");
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SubcategoryScreen(
                                        categories: data,
                                      )));
                            },
                          ),
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
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_outlined), label: 'Favourites'),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
          drawer: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/pastel.png"),
                    fit: BoxFit.cover)),
            child: Drawer(
              backgroundColor: Colors.transparent,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 80.h,
                  ),
                  Container(
                    height: 25.0,
                    child: DrawerHeader(
                      child: null,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  ListTile(
                    tileColor: Colors.white38,
                    trailing: Icon(
                      Icons.dashboard,
                      size: 18,
                      color: Colors.purple,
                    ),
                    title: Text(
                      "Dashboard",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExploreConsumer()));
                    },
                  ),
                  Divider(),
                  ListTile(
                    tileColor: Colors.white38,
                    trailing: Icon(
                      Icons.home,
                      size: 18,
                      color: Colors.purple,
                    ),
                    title: Text(
                      "Home Page",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConsumerMainPageScreen()));
                    },
                  ),
                  Divider(),
                  ListTile(
                    tileColor: Colors.white38,
                    trailing: Icon(
                      Icons.post_add,
                      size: 18,
                      color: Colors.purple,
                    ),
                    title: Text(
                      "Add requirements/Postings",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddRequirements()));
                    },
                  ),
                  Divider(),
                  ListTile(
                    tileColor: Colors.white38,
                    trailing: Icon(
                      Icons.person,
                      size: 18,
                      color: Colors.purple,
                    ),
                    title: Text(
                      "Profile",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConsumerProfile()));
                    },
                  ),
                  Divider(),
                  ListTile(
                    tileColor: Colors.white38,
                    trailing: Icon(
                      Icons.switch_account,
                      size: 18,
                      color: Colors.purple,
                    ),
                    title: Text(
                      "Switch to Service Provider",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signupSeller()));
                    },
                  ),
                  Divider(),
                  ListTile(
                    tileColor: Colors.white38,
                    trailing: Icon(
                      Icons.calendar_view_month_rounded,
                      size: 18,
                      color: Colors.purple,
                    ),
                    title: Text(
                      "View posted requirements",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onTap: () async {
                      final addedReqSnapshot = await FirebaseFirestore.instance
                          .collection('AddRequirements')
                          .get();
                      final addedrequirements = addedReqSnapshot.docs
                          .map((doc) => RequirementModel.fromJson(doc.data()))
                          .toList();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PostingDisplayedScreen(
                                    addedposting: {
                                      'All Requirements': addedrequirements,
                                    },
                                    id: 'id',
                                  )));
                    },
                  ),
                  Divider(),
                  ListTile(
                    tileColor: Colors.white38,
                    trailing: Icon(
                      Icons.logout,
                      size: 18,
                      color: Colors.purple,
                    ),
                    title: Text(
                      "Logout",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
