
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_flutter/seller/seller_homepage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';



class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();

  ShowAlert() {
    return showDialog(
      context: context,

      //   return BackdropFilter
      //(
      //filter: ImageFilter.blur(sigmaX:6,sigmaY: 6,
      //) );
      //}
      builder: (ctx) => AlertDialog(
        title: Text("Product has been added! "),
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFFA500),
                onPrimary: Colors.white,
                elevation: 3,
                minimumSize: const Size(150, 50),
                maximumSize: const Size(150, 50),
                shape: StadiumBorder(),
              ),
              child: Text('OK',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SellerHomePage()));
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
  File? imageFile;

  final TextEditingController ProductnameController = TextEditingController();
  final TextEditingController ProductDescriptionController =
      TextEditingController();
  final TextEditingController ProductpriceController = TextEditingController();

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


    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SellerHomePage()));
            },
          ),
          title: Text(
            'Add Product',
            style: TextStyle(color: Colors.white),
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
                          height: 30.h,
                        ),
                        Text('Add a new product to your inventory!',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              width: 135,
                              height: 135,
                              decoration: BoxDecoration(),
                              child: Image.asset(
                                  'assets/images/homeservicespic.PNG')),
                        ),
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
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10.0),
                            hintStyle:
                                TextStyle(fontSize: 13, color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.orange),
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
                          'Product Description',
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
                            hintText: 'Please enter product decription',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10.0),
                            hintStyle:
                                TextStyle(fontSize: 13, color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.orange),
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
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10.0),
                            hintStyle:
                                TextStyle(fontSize: 13, color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.orange),
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

                        Text('Product Image Sample',
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
                                      primary: Color(0xFFFFA500),
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
                              primary: Color(0xFFFFA500),
                              onPrimary: Colors.white,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              elevation: 3,
                              minimumSize: const Size(180, 50),
                              maximumSize: const Size(180, 50),
                            ),
                            child: Text('Add Product',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState?.save();
                                ShowAlert();
                                //
                                // final ref = FirebaseStorage.instance
                                //     .ref()
                                //     .child('Image URl').child('jpeg');
                                // //
                                // await ref.putFile(imageFile!);
                                // //
                                // final url = await ref.getDownloadURL();
                                //
                                // FirebaseFirestore.instance
                                //     .collection('addproducts')
                                //     .doc()
                                //     .set({
                                //   'product name': ProductnameController.text,
                                //   'product description':
                                //       ProductDescriptionController.text,
                                //   'product price': ProductpriceController.text,
                                //   'Image URl': url,
                                // });
                                if(imageFile != null){
                                  try {
                                    final ref = FirebaseStorage.instance
                                        .ref()
                                        .child('images/$filename');
                                    await ref.putFile(imageFile!);
                                    final url = await ref.getDownloadURL();
                                    // final randomId = Random().nextInt(100000).toString();
                                    FirebaseFirestore.instance
                                        .collection('addproducts')
                                        .doc()
                                        .set({
                                      'product name': ProductnameController.text,
                                      'product description': ProductDescriptionController.text,
                                      'product price': ProductpriceController.text,
                                      'Image URl': url,
                                    });
                                  } catch (e) {
                                    print(e);
                                  }
                                }else{
                                  print("image not selected");
                                }
                                // print(storage);
                              }
                              //  final seller = (
                              //
                              //          _productDescription: ProductDescriptionController.text,
                              //          password: passwordController.text)
                              //      ))
                              //      .user;
                              //
                              // await FirebaseFirestore.instance
                              //      .collection('sellers')
                              //      .doc(seller?.uid)
                              //      .set({
                              //    'Product name': seller?.uid,
                              //    'Product description': ProductDescriptionController.text,
                              //    'Product price': ProductpriceController.text,
                              //    'image URl': imageURLController.text,
                              //    'isAdmin': false,
                              //    'isApproved': false,
                              //  });
                            },
                          ),
                        ),

                        // TextFormField(
                        //   controller: imageURLController,
                        //   decoration: InputDecoration(
                        //     hintText: 'Please enter product sample',
                        //     contentPadding: const EdgeInsets.symmetric(
                        //         vertical: 15, horizontal: 10.0),
                        //     hintStyle:
                        //         TextStyle(fontSize: 13, color: Colors.grey),
                        //     border: OutlineInputBorder(
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(4)),
                        //       borderSide:
                        //           BorderSide(width: 1, color: Colors.orange),
                        //     ),
                        //   ),
                        //   validator: (value) {
                        //     if (value!.isEmpty) {
                        //       return 'Please enter a product image or sample';
                        //     }
                        //     return null;
                        //   },
                        //   onSaved: (value) => _productImage = value!,
                        // ),
                      ]),
                ))));
  }
}
