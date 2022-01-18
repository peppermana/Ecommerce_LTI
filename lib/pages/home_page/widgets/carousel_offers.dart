import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/api/api.dart';
import 'package:e_commerce/api/carousel/carousel_response.dart';
import 'package:flutter/material.dart';

class CarouselOffers extends StatefulWidget {

  final List<Data> listCarousel;

  const CarouselOffers({
    Key? key,
    required this.listCarousel,
  }) : super(key: key);



  @override
  State<CarouselOffers> createState() => _CarouselOffersState();
}

class _CarouselOffersState extends State<CarouselOffers> {


  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.listCarousel.map((value) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: 10),
          child: Image.network(
            Api.IMAGE_URL + "carousel/" + value.imgCarousel!
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
      ),
    );
  }
}