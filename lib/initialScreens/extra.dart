
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'ProfileScreen.dart';
import 'loginScreen.dart';

class HomeScreen extends StatefulWidget {

  // static const String id= 'inspection_reports';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;


  User? loggedInUser;

  // void initState() {
  //   super.initState();
  //   getCurrentUser();
  // }


  void getCurrentUser() async {
    try {
      final firebaseUser = await _auth.currentUser;
      if (firebaseUser != null) {
        loggedInUser = firebaseUser;
        print(loggedInUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }



  // LoginScreen({required Key key}) : super(key: key);
  String _myActivity = '';
  String _myActivityResult = '';
  String _myList = '';
  String _myFinalList = '';

  final loginFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    _myActivity = '';
    _myActivityResult = '';
    _myList = '';
    _myFinalList = '';  }

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(

      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          leading: null,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Welcome to Home Services! ',
              style: TextStyle(
                color: Color(0xFFFFA500),
                fontWeight: FontWeight.bold,
              )),
          // actions:<Widget> [
          //   // IconButton(
          //   //   icon: Image.asset('assets/images/balochistan.png'),
          //   //   onPressed: () => null,
          //   // ),
          //   // IconButton(
          //   //     icon: Icon(Icons.close),
          //   //     onPressed:() {
          //   //       _auth.signOut();
          //   //       Navigator.pop(context);
          //   //     }),
          // ],

        ),

        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            SizedBox(
              height: 110.h,
            ),

            Container(
              height: 130.0,
              child: DrawerHeader(
                child: Text(''),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage("assets/images/homeservicespic.PNG"),
                    )),
              ),
            ),
            SizedBox(
              height: 45.h,
            ),
            ListTile(
              leading: SizedBox(
                  height: 25.0,
                  width: 25.0, // fixed width and height
                  child:
                  new SvgPicture.asset('assets/images/ic_dashboard.svg')),
              title: const Text('Dashboard',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),

            ListTile(
              leading: SizedBox(
                  height: 25.0,
                  width: 25.0, // fixed width and height
                  child: new SvgPicture.asset(
                      'assets/images/ic_dashboard.svg')),
              title: const Text('Profile',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ));
              },
            ),
            ListTile(
                leading: SizedBox(
                    height: 25.0,
                    width: 25.0, // fixed width and height
                    child: new SvgPicture.asset(
                        'assets/images/ic_releaseReq.svg')),
                title: const Text('History',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => ReleaseScreen(),
                  //     ));
                }),

            ListTile(
              leading: SizedBox(
                  height: 25.0,
                  width: 25.0, // fixed width and height
                  child:
                  new SvgPicture.asset('assets/images/ic_expenditure.svg')),
              title: const Text('Orders Placed',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => ExpenditureScreen(),
              //       ));
               },
            ),

            ListTile(
              leading: SizedBox(
                  height: 25.0,
                  width: 25.0, // fixed width and height
                  ),
              title: const Text('Switch to service provider',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),


            ListTile(
              leading: SizedBox(
                  height: 25.0,
                  width: 25.0, // fixed width and height
                  child:
                  new SvgPicture.asset('assets/images/ic_dashboard.svg')),
              title: const Text('Log out',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            //
          ]),
        ),

      ),
    );
  }
}
