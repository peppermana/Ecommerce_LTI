import 'dart:convert';
import 'package:e_commerce/api/category/category_response.dart';
import 'package:e_commerce/api/feed/feed_response.dart';
import 'package:e_commerce/api/help/help_response.dart';
import 'package:e_commerce/api/product/product_response.dart';
import 'package:e_commerce/api/sub_category/sub_category_response.dart';
import 'package:http/http.dart' as http;

import 'carousel/carousel_response.dart';

const baseUrl = "http://192.168.1.7/webservice_ecommerce/index.php/Api/";

class Api {
  //Carousel
  static const IMAGE_URL = "http://192.168.1.7/webservice_ecommerce/image/";

  static Future<CarouselResponse> getCarousel() async {
    var url = baseUrl + "Carousel/select_carousel";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return CarouselResponse.fromJson(jsonDecode(response.body));
    } else {
      throw "unable show list carousel";
    }
  }

  //category
  static Future<CategoryResponse> getCategory() async {
    var url = baseUrl + "Category/select_category";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return CategoryResponse.fromJson(jsonDecode(response.body));
    } else {
      throw "can't show category";
    }
  }

  //Api untuk product response
  static Future<ProductResponse> getProduct() async {
    var url = baseUrl + "Product/select_product";

    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return ProductResponse.fromJson(jsonDecode(response.body));
    } else {
      throw "can't show the product";
    }
  }

  //Api untuk feed
  static Future<FeedResponse> getFeed() async{
    var url = baseUrl + "Feed/select_feed";

    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      return FeedResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "cant show the Feed";
    }
  }

  static Future<HelpResponse> getHelp() async{
    var url = baseUrl + "Help/select_help";

    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      return HelpResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "cant show";
    }
  }

  static Future <SubCategoryResponse> getSubCategory(String, id) async{

    var url = baseUrl + "Catgeory/select_list_subcategory/$id";

    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      return SubCategoryResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "can't show the SubCategory";
    }
  }

}
