import 'package:e_commerce/api/api.dart';
import 'package:e_commerce/api/category/category_response.dart';
import 'package:e_commerce/pages/sub_category/sub_category.dart';
import 'package:flutter/material.dart';

class ListViewCategory extends StatefulWidget {

  final List<Data> listCategory;

  const ListViewCategory({
    Key? key, required this.listCategory,
  }) : super(key: key);

  @override
  State<ListViewCategory> createState() => _ListViewCategoryState();
}

class _ListViewCategoryState extends State<ListViewCategory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => SubCategory(id: widget.listCategory[index].idCategory!,)),
                );
              },
              child: Container(
                margin: (index == 0)
                    ? EdgeInsets.fromLTRB(15, 20, 10, 20)
                    : EdgeInsets.fromLTRB(0, 20, 10, 20),
                width: 155,
                height: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Image.network(
                       Api.IMAGE_URL + widget.listCategory[index].imageCategory!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        color: Color(0x97727272),
                      ),
                      Center(
                        child: Text(
                            widget.listCategory[index].nameCategory!,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}