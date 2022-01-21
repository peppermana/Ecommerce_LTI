import 'package:flutter/material.dart';


class DetailProductItem extends StatelessWidget {
  final String  nameProduct, nameCategory, descProduct, stockProduct;

  final int priceProduct;

  const DetailProductItem({Key? key, required this.nameProduct, required this.nameCategory, required this.descProduct, required this.stockProduct, required this.priceProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container (
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(nameCategory),
              SizedBox(
                height: 5,
              ),
              Text(nameProduct, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
             SizedBox(
               height: 5,
             ),
              Text(
                "$stockProduct stock available",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}
