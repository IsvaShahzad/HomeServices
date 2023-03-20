import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_flutter/categories_seller/SellerCategories.dart';
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

  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _occupationController = TextEditingController();
  TextEditingController _experienceController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _productsController = TextEditingController();

  bool _isEditing = false;

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  void initState() {
    super.initState();
    _nameController.text= 'Isva Shahzad';
    _occupationController.text = 'Baker';
    _experienceController.text = '2 years';
    _descriptionController.text =
    'My name is Isva Shahzad and I am an expert in making baked products such as cakes, brownies and pizzas. I have an experience of two years which has given me a detailed insight on how baked goods and their making is done. I use all organic and homemade items for the baking of my products. I can guarantee you that the quality of my goods is up to your taste and likings!';
    _productsController.text =
    '• Chocolate Brownies\n• Confetti Cupcakes\n• Pumpkin Spice Cake\n• Margarita Pizza';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/pastel.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 13,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
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
            actions: [
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () => _toggleEdit(),
              ),
            ],
          ),
          body: Form(
              key: _formKey,
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
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              'Name:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),

                            Container(
                              child: Padding(
                                  padding: EdgeInsets.only(top: 13),
                                   child:TextFormField(
                                    controller: _nameController,
                                  )),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),

                            Text(
                              'Occupation:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),


                            Container(
                              child: Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child:TextFormField(
                                    controller: _occupationController,
                                  )),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),

                            Text(
                              'Experience:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),

                            Container(
                              child: Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child:TextFormField(
                                    controller: _experienceController,
                                  )),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),

                            Text(
                              'Description:',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                Container(
                  width: 300,
                  height: 190,
                  child: TextFormField(
                    controller: _descriptionController,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: 'Enter description...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              'Products:',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),

                            Container(
                              width: 300,
                              height: 200,

                              child: Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child:TextFormField(
                                    controller: _productsController,
                                    maxLines: 4,

                                  )),
                            ),

                            SizedBox(
                              height: 20.h,
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
                          ]))))),
    );
  }

}
