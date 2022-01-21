
import 'package:e_commerce/api/sub_category/sub_category_response.dart';
import 'package:e_commerce/pages/sub_category/widgets/sub_category_item.dart';
import 'package:flutter/material.dart';

class SubCategoryList extends StatefulWidget {
  //2
  //class ini butuh constructor, subCategory Listdata dan category
  final List<Data> subCategoryListData;
  final String category;

  const SubCategoryList({Key? key, required this.subCategoryListData, required this.category}) : super(key: key);

  @override
  _SubCategoryListState createState() => _SubCategoryListState();
}

class _SubCategoryListState extends State<SubCategoryList> {
  @override
  Widget build(BuildContext context) {

    //jika jumlah dari subCategorynya adalah lebih dari 0 atau tidak kosong
    if (widget.subCategoryListData.length > 0) {
      //tampilkan listnya
      return Expanded(
        child: Container(
          child: GridView.builder(
            itemCount: widget.subCategoryListData.length,
            itemBuilder: (context, index) {
              return SubCategoryItem(data: widget.subCategoryListData[index],);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          ),
        ),
      );
    } else {
      //muncul pesan error di tengah halaman
      return Expanded(
        child: Center(
          child: Text(
            "List Subcategory is empty"
            ,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );
    }
  }
}

