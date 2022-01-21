import 'package:e_commerce/api/api.dart';
import 'package:e_commerce/api/detail_sub_category/detail_sub_category_response.dart';
import 'package:e_commerce/pages/detail_sub_category/widgets/detail_subcategory_list.dart';
import 'package:flutter/material.dart';


class DetailSubCategory extends StatefulWidget {

  final String idSubCategory;
  final String subcategory;

  const DetailSubCategory({Key? key, required this.idSubCategory, required this.subcategory}) : super(key: key);

  @override
  _DetailSubCategoryState createState() => _DetailSubCategoryState();
}

class _DetailSubCategoryState extends State<DetailSubCategory> {

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  //untuk menampung response webservice
  //Future = menerima response di lain waktu, tergantung beberapa lama webservice melakukan response
  late Future<DetailSubCategoryResponse> detailSubCategoryList;

  //ketika refresh halaman, panggil subCategory lagi/request data ke webservice lagi
  Future <void> onSwipeRefresh() async{
    detailSubCategoryList = Api.getDetailSubCategory(widget.idSubCategory);

  }
  @override
  void initState() {
    //request data ke webservice sebelum function build() selesai dieksekusi
    detailSubCategoryList = Api.getDetailSubCategory(widget.idSubCategory);

    //inisialisasi untuk swipe refresh
    //memberikan callback ketika user swipe dari atas maka akan dieksekusi show()

    // widgetsBinding.instance!
    // .addPostFrameCallback(() => refreshIndicatorKey.currentState.show());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: onSwipeRefresh,
            child: ListView(
              children: [
             Container(
               height: height,
               width: width,
               child: Column(
                 children: [

                   FutureBuilder(
                     future: detailSubCategoryList,
                     builder: (context, AsyncSnapshot<DetailSubCategoryResponse>snapshot){
                       if(snapshot.hasData){
                         // print(snapshot.data!.data!);
                         return DetailSubCategoryList(
                           subCategory: widget.subcategory,
                           detailSubCategoryData: snapshot.data!.data!,
                         );
                       }else if(snapshot.hasError){
                         return Expanded(
                           child: Center(
                             child: Text("something wrong")
                           ),
                         );
                       }else{
                         return Expanded(
                           child: Center(
                             child: CircularProgressIndicator(),
                           ),
                         );
                       }
                     },
                   ),
                 ],
               ),
             ),
              ]
            ),
        ),
      ),
    );
  }
}
