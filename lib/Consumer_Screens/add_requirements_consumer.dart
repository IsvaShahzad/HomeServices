import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_flutter/Consumer_Screens/Consumer_mainpage.dart';
import 'package:home_services_flutter/Consumer_Screens/postings_displayed.dart';
import 'package:home_services_flutter/categories_seller/SellerCategories.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';

class ProductModel {
  final String productname;
  final String productprice;
  final String ImageURl;
  final String productdescription;
  final String productquantity;
  final String email;
  final String mobile;
  final String deliverydate;

  ProductModel({
    required this.productname,
    required this.productprice,
    required this.ImageURl,
    required this.productdescription,
    required this.productquantity,
    required this.email,
    required this.mobile,
    required this.deliverydate,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productname: json['product name'],
      productprice: json['product price'],
      ImageURl: json['Image URl'],
      productdescription: json['product description'],
      productquantity: json['product quantity'],
      mobile: json['Mobile Number'],
      email: json['Contact email'],
      deliverydate: json['Delivery Date'],
    );
  }
}

class AddRequirements extends StatefulWidget {
  @override
  _AddRequirementsState createState() => _AddRequirementsState();
}

class _AddRequirementsState extends State<AddRequirements> {
  final _formKey = GlobalKey<FormState>();

  ShowAlert() {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Requirements have been posted! "),
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFAB47BC),
                onPrimary: Colors.white,
                elevation: 3,
                minimumSize: const Size(150, 50),
                maximumSize: const Size(150, 50),
                shape: StadiumBorder(),
              ),
              child: Text('OK',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              onPressed: () async {
                final addedProductsSnapshot = await FirebaseFirestore.instance
                    .collection('AddRequirements')
                    .get();
                final addedrequirements = addedProductsSnapshot.docs
                    .map((doc) => ProductModel.fromJson(doc.data()))
                    .toList();
                addedrequirements.forEach((product) {
                  print('Name: ${product.productname}');
                  print('Price: ${product.productprice}');
                  print('Image: ${product.ImageURl}');
                  print('Description: ${product.productdescription}');
                  print('Quantity: ${product.productquantity}');
                });

                print(addedrequirements);

                // Add this line
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PostingDisplayedScreen(
                                addedposting: {
                                  'AddRequirements': addedrequirements
                                })));
              },
            ),
          )
        ],
      ),
    );
  }

  late String _productName;
  late String _productDescription;
  late double _productPrice;
  late String _productQuantity;
  late String _Deliverydate;
  late int _mobile;
  late String _email;

  File? imageFile;

  final TextEditingController ProductnameController = TextEditingController();
  final TextEditingController ProductDescriptionController =
      TextEditingController();
  final TextEditingController ProductpriceController = TextEditingController();
  final TextEditingController ProductQuantityController =
      TextEditingController();
  final TextEditingController dateinput = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController Mobilecontroller = TextEditingController();

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('AddRequirements');

  late Stream<QuerySnapshot> _streamCategory = _collectionRef.snapshots();

  @override
  void initState() {
    super.initState();
    _streamCategory = _collectionRef.snapshots();
    dateinput.text = ""; //set the initial value of text field
  }

  selectFile() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxHeight: 100, maxWidth: 180);

    if (file != null) {
      setState(() {
        imageFile = File(file.path);
      });
    }
  }

  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    String filename = "";

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
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConsumerMainPageScreen()));
                },
              ),
              title: Align(
                alignment: Alignment.center,
                child: Text(
                  'Add Requirements',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            body: Form(
                key: _formKey,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 45.h,
                            ),
                            Text('Add and post requirements your way!',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold)),
                            Padding(padding: EdgeInsets.only(top: 18)),
                            Text('Product name',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 5.h,
                            ),
                            TextFormField(
                              controller: ProductnameController,
                              decoration: InputDecoration(
                                hintText: 'Please enter product name',
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.1),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10.0),
                                hintStyle:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.purple),
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a product name';
                                }
                                return null;
                              },
                              onSaved: (value) => _productName = value!,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              'Product Description/Customization',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            TextFormField(
                              controller: ProductDescriptionController,
                              decoration: InputDecoration(
                                hintText: 'Please enter product description',
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.1),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10.0),
                                hintStyle:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.purple),
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a product description';
                                }
                                return null;
                              },
                              onSaved: (value) => _productDescription = value!,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text('Product Price',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 5.h,
                            ),
                            TextFormField(
                              controller: ProductpriceController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Please enter product price',
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.1),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10.0),
                                hintStyle:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.orange),
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a product price';
                                }
                                return null;
                              },
                              onSaved: (value) =>
                                  _productPrice = double.parse(value!),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              'Product Quantity',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            TextFormField(
                              controller: ProductQuantityController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Please enter product quantity',
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.1),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10.0),
                                hintStyle:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.purple),
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a product name';
                                }
                                return null;
                              },
                              onSaved: (value) => _productName = value!,
                            ),

                            SizedBox(
                              height: 20.h,
                            ),
                            Text(' Delivery Date',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: TextFormField(
                                controller: dateinput,
                                decoration: InputDecoration(
                                  //icon of text field
                                  labelText: "",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  icon: Icon(Icons.calendar_today),
                                  hintText: ' Enter date ',
                                ),
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2100));

                                  if (pickedDate != null) {
                                    print(
                                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                    String formattedDate =
                                        DateFormat('dd-MM-yyyy')
                                            .format(pickedDate);
                                    print(
                                        formattedDate); //formatted date output using intl package =>  2021-03-16
                                    setState(() {
                                      dateinput.text =
                                          formattedDate; //set output date to TextField value.
                                    });
                                  } else {}
                                },
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.w600),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Some Text ';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              'Contact Email',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'Please your email',
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.1),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10.0),
                                hintStyle:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.purple),
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter email';
                                }
                                return null;
                              },
                              onSaved: (value) => _productName = value!,
                            ),

                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              'Mobile Number',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFF000000),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            TextFormField(
                              controller: Mobilecontroller,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Please enter mobile number',
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.1),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10.0),
                                hintStyle:
                                    TextStyle(fontSize: 13, color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.purple),
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter mobile number';
                                }
                                return null;
                              },
                              onSaved: (value) => _productName = value!,
                            ),
                            SizedBox(
                              height: 15.h,
                            ),

                            // if (_selectedCategory != null) ...[
                            Text('Product Sample Image',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              height: 160,
                              width: 200,
                              child: Column(
                                children: [
                                  if (imageFile != null)
                                    Container(
                                      child: Image.file(
                                        File(imageFile!.path),
                                      ),
                                    ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Color(0xFFAB47BC),
                                          onPrimary: Colors.white,
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(30.0),
                                          ),
                                        ),
                                        onPressed: selectFile,
                                        child: const Text(
                                          'Select file',
                                        )),
                                  )
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFAB47BC),
                                  onPrimary: Colors.white,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                  elevation: 3,
                                  minimumSize: const Size(180, 50),
                                  maximumSize: const Size(180, 50),
                                ),
                                child: Text('Post Requirement',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    )),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState?.save();
                                    ShowAlert();

                                    if (imageFile != null) {
                                      try {
                                        final ref = FirebaseStorage.instance
                                            .ref()
                                            .child('images/$filename');
                                        await ref.putFile(imageFile!);
                                        final url = await ref.getDownloadURL();

                                        FirebaseFirestore.instance
                                            .collection('AddRequirements')
                                            .doc()
                                            .set({
                                          'product name':
                                              ProductnameController.text,
                                          'product description':
                                              ProductDescriptionController.text,
                                          'product price':
                                              ProductpriceController.text,
                                          'product quantity':
                                              ProductQuantityController.text,
                                          'Delivery Date': dateinput.text,
                                          'Contact email': emailController.text,
                                          'Mobile Number':
                                              Mobilecontroller.text,
                                          'Image URl': url,
                                        });
                                      } catch (e) {
                                        print(e);
                                      }
                                    } else {
                                      print("image not selected");
                                    }
                                    // print(storage);
                                  }
                                },
                              ),
                            )
                          ]),
                    )))));
  }
}
