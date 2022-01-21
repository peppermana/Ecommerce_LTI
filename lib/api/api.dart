import 'dart:convert';
import 'package:e_commerce/api/add_to_cart/add_to_cart_response.dart';
import 'package:e_commerce/api/cart/cart_response.dart';
import 'package:e_commerce/api/category/category_response.dart';
import 'package:e_commerce/api/check_cart/check_cart_response.dart';
import 'package:e_commerce/api/delete_cart/delete_cart_response.dart';
import 'package:e_commerce/api/detail_sub_category/detail_sub_category_response.dart';
import 'package:e_commerce/api/feed/feed_response.dart';
import 'package:e_commerce/api/help/help_response.dart';
import 'package:e_commerce/api/login/login_response.dart';
import 'package:e_commerce/api/product/product_response.dart';
import 'package:e_commerce/api/sub_category/sub_category_response.dart';
import 'package:e_commerce/api/update_cart_response/update_cart_response.dart';
import 'package:http/http.dart' as http;

import 'carousel/carousel_response.dart';
import 'detail_product/detail_product_response.dart';

const baseUrl = "http://192.168.1.34/web_permana/webservice_ecommerce/index.php/Api/";

class Api {
  //Carousel
  static const IMAGE_URL = "http://192.168.1.34/web_permana/webservice_ecommerce/image/";

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

  static Future<SubCategoryResponse> getSubCategory(String id) async{

    var url = baseUrl + "Category/select_list_subcategory/$id";

    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      return SubCategoryResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "can't show the SubCategory";
    }
  }

  static Future<DetailSubCategoryResponse> getDetailSubCategory(String id) async{

    var url = baseUrl + "Category/select_subcategory_by_id/$id";
    // print(url);
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      return DetailSubCategoryResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "cant show the detail";
    }
  }

  static Future<CartResponse> getCartResponse() async{

    var url = baseUrl + "Cart/select_check_cart";

    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200 ){
      return CartResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Can't show the Cart";
    }
  }

  static Future<DetailProductResponse> getDetailProduct(String id) async{

    var url = baseUrl + "Product/select_product_by_id/$id";

    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200 ){
      return DetailProductResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Can't show the Cart";
    }
  }


  static Future<CheckCartResponse> checkCart(String idUser, String idProduct) async{

    var url = baseUrl + "Cart/select_check_cart/$idUser/$idProduct";

    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200 ){
      return CheckCartResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Can't show the Cart";
    }
  }

  //Login
  static Future<LoginResponse> Login(Map<String, String> dataLogin) async{

    var url = baseUrl + "Auth/login";

    var response = await http.post(Uri.parse(url), body: dataLogin);
    if(response.statusCode == 200 ){
      return LoginResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Can't show the Cart";
    }
  }


  //Cart
  //add to cart
  static Future<AddToCartResponse> AddToCart(Map<String, String> dataProduct) async{

    var url = baseUrl + "Cart/add_cart/";

    var response = await http.post(Uri.parse(url), body: dataProduct);
    if(response.statusCode == 200 ){
      return AddToCartResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Can't show the Cart";
    }
  }

  //delete
  static Future<DeleteCartResponse> DeleteCart(String idCart) async{

    var url = baseUrl + "Cart/delete_cart/$idCart";

    var response = await http.post(Uri.parse(url));
    if(response.statusCode == 200 ){
      return DeleteCartResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Can't show the Cart";
    }
  }

  //Update cart
  static Future<UpdateCartResponse> updateCart(Map<String,String> dataProduct) async{

    var url = baseUrl + "Cart/update_cart/";

    var response = await http.post(Uri.parse(url), body: dataProduct);
    if(response.statusCode == 200 ){
      return UpdateCartResponse.fromJson(jsonDecode(response.body));
    }else{
      throw "Unable to update Cart";
    }
  }


}




