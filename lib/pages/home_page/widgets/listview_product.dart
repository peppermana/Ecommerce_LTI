import 'package:e_commerce/api/api.dart';
import 'package:e_commerce/api/product/product_response.dart';
import 'package:e_commerce/pages/detail_product/detail_product.dart';
import 'package:flutter/material.dart';

class ListViewProduct extends StatefulWidget {

  final List<Data> listProduct;

  const ListViewProduct({
    Key? key, required this.listProduct,
  }) : super(key: key);

  @override
  State<ListViewProduct> createState() => _ListViewProductState();
}

class _ListViewProductState extends State<ListViewProduct> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        itemCount: widget.listProduct.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 140,
            margin:
            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                   Navigator.of(context).push(MaterialPageRoute (builder: (context) => DetailProduct(idProduct: widget.listProduct[index].idProduct!,)));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        Api.IMAGE_URL + widget.listProduct[index].imageProduct!,
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                          return Image.asset(
                            "assets/noimageplaceholder.png",
                          );
                        },
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.listProduct[index].nameCategory!, overflow: TextOverflow.ellipsis, maxLines: 1,),
                          Text(widget.listProduct[index].nameProduct!),
                          SizedBox(
                            height: 5,
                          ),
                          Text(widget.listProduct[index].priceProduct!),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}