import 'package:flutter/material.dart';

class CategoryLabel extends StatelessWidget {


  const CategoryLabel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10),
      child: Text(
        "category",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
      ),
    );
  }
}