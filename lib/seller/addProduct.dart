import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();

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
              padding: const EdgeInsets.symmetric(horizontal: 9.0),
              child: Column(children: <Widget>[
                SizedBox(
                  height: 30.h,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Product Name'),
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
                TextFormField(
                  decoration: InputDecoration(labelText: 'Product Description'),
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
                TextFormField(
                  decoration: InputDecoration(labelText: 'Product Price'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a product price';
                    }
                    return null;
                  },
                  onSaved: (value) => _productPrice = double.parse(value!),
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Product Image URL'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a product image URL';
                    }
                    return null;
                  },
                  onSaved: (value) => _productImage = value!,
                ),
                SizedBox(
                  height: 30.h,
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
            )));
  }
}
