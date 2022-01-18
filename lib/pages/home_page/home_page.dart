import 'package:e_commerce/api/api.dart';
import 'package:e_commerce/api/carousel/carousel_response.dart';
import 'package:e_commerce/api/category/category_response.dart';
import 'package:e_commerce/api/product/product_response.dart';
import 'package:e_commerce/pages/home_page/widgets/carousel_offers.dart';
import 'package:e_commerce/pages/home_page/widgets/category_label.dart';
import 'package:e_commerce/pages/home_page/widgets/listview_category.dart';
import 'package:e_commerce/pages/home_page/widgets/listview_product.dart';
import 'package:e_commerce/pages/home_page/widgets/newproduct_label.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> onSwipeRefresh() async {}

  //untuk memunculkan carousel
  Future<CarouselResponse> dataCarousel = Api.getCarousel();

  //untuk memunculkan listview_category
  Future<CategoryResponse> dataCategory = Api.getCategory();

  //untuk memunculkan  listview_product
  Future<ProductResponse> dataProduct = Api.getProduct();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return onSwipeRefresh();
      },
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //untuk gambar bergulir otomatis => file widget

              //untuk membuat proses loading => carousel
              FutureBuilder(
                  future: dataCarousel,
                  builder: (context, AsyncSnapshot<CarouselResponse> snapShot) {
                    //ketika ada datanya
                    if (snapShot.hasData) {
                      return CarouselOffers(listCarousel: snapShot.data!.data!);
                      //ketika error
                    } else if (snapShot.hasError) {
                      return Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Center(child: Text("something wrong")),
                      );
                    }

                    //container ini akan muncul ketika tidak dari kedua kondisi itu
                    //container ini biasanya akan ditampilkan lebih dulu karena dalam kondisi belum diketahui apakah error atau ada datanya
                    return Container(
                        width: double.infinity,
                        height: 120,
                        child: Center(child: CircularProgressIndicator()));
                  }),

              SizedBox(height: 20),

              //tulisan category
              CategoryLabel(),

              //listview category
              FutureBuilder(
                future: dataCategory,
                builder: (context, AsyncSnapshot<CategoryResponse> snapshot) {
                  if (snapshot.hasData) {
                    return ListViewCategory(listCategory: snapshot.data!.data!);
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
                    return Container(
                      width: double.infinity,
                      height: 300,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
              ),



              //new product
              NewProductLabel(),

              //listview product
              FutureBuilder(
                  future: dataProduct,
                  builder: (context, AsyncSnapshot<ProductResponse> snapshot) {
                    if (snapshot.hasData) {
                      return ListViewProduct(listProduct: snapshot.data!.data!);
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
                      return Container(
                        width: double.infinity,
                        height: 120,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
