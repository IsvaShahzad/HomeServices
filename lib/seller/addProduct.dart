import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController ProductnameController = TextEditingController();

  final TextEditingController ProductDescriptionController =
      TextEditingController();
  final TextEditingController ProductpriceController = TextEditingController();
  final TextEditingController imageURLController = TextEditingController();

  late String _productName;
  late String _productDescription;
  late double _productPrice;
  late String _productImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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

                              child:
                              Image.asset('assets/images/homeservicespic.PNG')),
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
                        Text('Product Image URL',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextFormField(
                          controller: imageURLController,
                          decoration: InputDecoration(
                            hintText: 'Please enter image url',
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a product image URL';
                            }
                            return null;
                          },
                          onSaved: (value) => _productImage = value!,
                        ),
                        SizedBox(
                          height: 25.h,
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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState?.save();
                                // Add the product to the seller's inventory
                              }
                            },
                          ),
                        ),
            ]),
                ))));
  }
}
