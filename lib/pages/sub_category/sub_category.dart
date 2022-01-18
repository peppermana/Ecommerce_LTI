import 'package:e_commerce/api/api.dart';
import 'package:e_commerce/api/sub_category/sub_category_response.dart';
import 'package:flutter/material.dart';

class SubCategory extends StatefulWidget {
  const SubCategory({Key? key}) : super(key: key);

  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {


  Future<void> onSwipeRefresh() async {
    listSubCategory = Api.getSubCategory(String, id);
  }

  late Future<SubCategoryResponse> listSubCategory;

  @override
  void initState() {
    listSubCategory = Api.getSubCategory(String, id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return onSwipeRefresh();
          },
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    // subPageTitle(),

                    FutureBuilder(
                        future: listCategory,
                        builder: (context,
                            AsyncSnapshot<SubCategoryResponse> snapshot) {
                          if (snapshot.hasData) {
                            return Expanded(
                              child: Container(
                                child: GridView.builder(
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        //  Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             DetailSubCategoryPage()));
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 150,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                "assets/logo.png",
                                                height: double.infinity,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                              Container(
                                                color: Color(0x3b0a0a0a)
                                              ),
                                              Center(
                                                child: Text(
                                                  "sas",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(color: Colors.white)
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                                ),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text("Center"),
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
