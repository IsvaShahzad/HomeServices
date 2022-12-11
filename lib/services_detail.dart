import 'package:flutter/material.dart';

class ServiceDetail extends StatelessWidget {

  final String title;

  ServiceDetail(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(title),

      ),
    );
  }
}
