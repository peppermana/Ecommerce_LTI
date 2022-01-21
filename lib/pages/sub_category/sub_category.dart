import 'package:e_commerce/api/api.dart';
import 'package:e_commerce/api/sub_category/sub_category_response.dart';
import 'package:e_commerce/pages/sub_category/widgets/sub_category_list.dart';
import 'package:flutter/material.dart';

class SubCategory extends StatefulWidget {
  final String id;

  const SubCategory({Key? key, required this.id}) : super(key: key);

  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  late Future<SubCategoryResponse> listSubCategory;

  Future<void> onSwipeRefresh() async {
    listSubCategory = Api.getSubCategory(widget.id);
  }

  @override
  void initState() {
    listSubCategory = Api.getSubCategory(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.height;
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return onSwipeRefresh();
          },
          child: ListView(
            children: [
              Container(
                width: width,
                height: height,
                child: Column(
                  children: [
                    // subPageTitle(),

                    FutureBuilder(
                        future: listSubCategory,
                        builder: (context,
                            AsyncSnapshot<SubCategoryResponse> snapshot) {
                          if (snapshot.hasData) {
                            //1
                            //mengembalikan widget subCategoryList ketika data dari Api sudah ada
                            //dan mengirimkan data snapshot beserta dengan nama categorynya
                            return SubCategoryList(category: "" , subCategoryListData: snapshot.data!.data!,);
                          } else if (snapshot.hasError) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text("something wrong"),
                              ),
                            );
                          } else {
                            return Expanded(
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
