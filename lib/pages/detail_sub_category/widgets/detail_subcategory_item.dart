import 'package:e_commerce/api/api.dart';
import 'package:e_commerce/api/detail_sub_category/detail_sub_category_response.dart';
import 'package:e_commerce/pages/detail_product/detail_product.dart';
import 'package:flutter/material.dart';

class DetailSubCategoryItem extends StatelessWidget {
  
  final Data data;
  
  const DetailSubCategoryItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DetailProduct(idProduct: data.idProduct!)));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  Api.IMAGE_URL + data.imageProduct!,
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  children: [
                    Text(data.nameProduct!),

                    SizedBox(
                      height: 5,
                    ),
                    Text(data.priceProduct!),
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

