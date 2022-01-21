import 'package:e_commerce/api/api.dart';
import 'package:e_commerce/api/sub_category/sub_category_response.dart';
import 'package:e_commerce/pages/detail_sub_category/detail_sub_category.dart';
import 'package:flutter/material.dart';


class SubCategoryItem extends StatelessWidget {
  final Data data;

  const SubCategoryItem({
    Key? key, required this.data,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
         Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) =>
                    DetailSubCategory(subcategory: data.nameSubcategory!, idSubCategory: data.idSubcategory!,)));
      },
      child: Container(
        width: 150,
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Image.network(
                Api.IMAGE_URL + data.imageSubcategory!,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(color: Color(0x3b0a0a0a)),
              Center(
                child: Text(data.nameSubcategory!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}