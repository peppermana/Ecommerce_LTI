import 'package:flutter/material.dart';

class NewProductLabel extends StatelessWidget {
  const NewProductLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10),
      child: Text(
        "New Product",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
      ),
    );
  }
}