import 'package:flutter/material.dart';

class UnknownRoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Page Not Found!')),
        body: SafeArea(child: Text('Page Not Found!')));
  }
}
