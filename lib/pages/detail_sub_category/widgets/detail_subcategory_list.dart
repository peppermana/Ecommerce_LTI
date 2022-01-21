import 'package:e_commerce/api/detail_sub_category/detail_sub_category_response.dart';
import 'package:flutter/material.dart';

import 'detail_subcategory_item.dart';

class DetailSubCategoryList extends StatefulWidget {
  final List<Data> detailSubCategoryData;
  final String subCategory;

  const DetailSubCategoryList(
      {Key? key,
      required this.detailSubCategoryData,
      required this.subCategory})
      : super(key: key);

  @override
  _DetailSubCategoryListState createState() => _DetailSubCategoryListState();
}

class _DetailSubCategoryListState extends State<DetailSubCategoryList> {
  @override
  Widget build(BuildContext context) {
    if (widget.detailSubCategoryData.length > 0) {
      return Expanded(
        child: GridView.builder(
          itemCount:widget.detailSubCategoryData.length ,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return DetailSubCategoryItem(
                  data: widget.detailSubCategoryData[index]);
            }),
      );
    } else {
      return Expanded(
          child: Center(
        child: Text(
          "Detail SubCategory is empty",
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ));
    }
  }
}
