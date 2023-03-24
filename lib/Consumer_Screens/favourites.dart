import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_services_flutter/initialScreens/verify_email.dart';

import '../initialScreens/loginScreen.dart';

class Favourites_Screen extends StatefulWidget {
  @override
  State<Favourites_Screen> createState() => _Favourites_ScreenState();
}

class _Favourites_ScreenState extends State<Favourites_Screen> {
  bool _isObscure = true;

  final loginFormKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
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
              actions: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }),

              ],
              title: Align(
                alignment: Alignment.center,
                child: Text(
                  "Favourites  ❤ ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            body: Container()));
  }
}
