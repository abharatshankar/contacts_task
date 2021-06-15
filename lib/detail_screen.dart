import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String contactName;
  const DetailScreen({Key key, this.contactName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(contactName ?? "N/A"),
      ),
    );
  }
}
