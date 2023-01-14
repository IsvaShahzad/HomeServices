import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_flutter/seller/SellerCategories.dart';
class SellerWelcome extends StatefulWidget {

  @override
  State<SellerWelcome> createState() => _SellerWelcomeState();
}

class _SellerWelcomeState extends State<SellerWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body: Form(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
    child: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    SizedBox(
    height: 30.h,
    ),
    Text('Welcome to seller page, click to explore!',
    style: TextStyle(
    fontSize: 24,
    color: Colors.orange,
    fontWeight: FontWeight.bold)),

      Align(
        alignment: Alignment.centerRight,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFFFFA500),
              onPrimary: Colors.white,
              shape: new RoundedRectangleBorder(
                borderRadius:
                new BorderRadius.circular(30.0),
              ),
            ),
            onPressed: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SellerHomePage()));
            },
            child: const Text(
              'Next ',
            )),
      )
    ]),


    ))));
  }
}
