import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_flutter/seller/SellerCategories.dart';
import 'package:url_launcher/url_launcher.dart';

class SellerPortfolio extends StatefulWidget {
  @override
  _SellerPortfolioState createState() => _SellerPortfolioState();
}

class _SellerPortfolioState extends State<SellerPortfolio> {
  String name = '';
  String picture = '';
  String workDone = '';
  List<String> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SellerHomePage()));
            },
          ),
          title: Text(
            'Seller Portfolio',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Form(
            // key: _formKey,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 50)),
                      Text(
                        'Details:',
                        style: TextStyle(
                          fontSize: 20,

                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 18),
                          child: Text(
                            'Name : Isva Shahzad',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            'Occupation : Baker',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 18),
                          child: Text(
                            'Experience : 2 years',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )),
                      Padding(padding: EdgeInsets.only(top: 45)),
                      Text(
                        'Description:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 18),
                          child: Text(
                            'My name is Isva Shahzad and Iam an expert in making baked products such as cakes, brownies and pizzas.'
                            ' I have an experince of two years which has given me a detailed insight on how baked goods and their making is done. I use all organic and home made '
                            'items for the baking of my products. I can guarantee you that the quality of my goods is up to your taste and likings! ',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )),
                      Padding(padding: EdgeInsets.only(top: 40)),
                      Text(
                        'Products: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 18),
                          child: Text(
                            '• Chocolate Brownies',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 18),
                          child: Text(
                            '• Confetti Cupcakes',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 18),
                          child: Text(
                            '• Pumpkin spice cake',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 18),
                          child: Text(
                            '• Margarita pizza',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )),
                      SizedBox(
                        height: 60.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Text("Contact me! ",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            IconButton(
                              onPressed: () async {
                                var emailUrl =
                                    'mailto:isvashaz2@gmail.com?subject=Example Subject&body=Example Body';
                                Uri emailUri = Uri.parse(emailUrl);
                                await launchUrl(emailUri);
                              },
                              icon: Icon(
                                Icons.email,
                                color: Colors.deepOrange,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ])))));
  }
}
