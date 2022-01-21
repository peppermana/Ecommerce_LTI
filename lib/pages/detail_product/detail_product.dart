import 'package:e_commerce/api/api.dart';
import 'package:e_commerce/api/cart/cart_response.dart';
import 'package:e_commerce/api/check_cart/check_cart_response.dart';
import 'package:e_commerce/api/detail_product/detail_product_response.dart';
import 'package:e_commerce/config/Utils.dart';
import 'package:e_commerce/config/login_pref.dart';
import 'package:e_commerce/pages/detail_product/widgets/description.dart';
import 'package:e_commerce/pages/detail_product/widgets/detail_product_item.dart';
import 'package:e_commerce/pages/detail_product/widgets/footer.dart';
import 'package:flutter/material.dart';

class DetailProduct extends StatefulWidget {
  final String idProduct;
  final bool editCart;



  const DetailProduct({Key? key, required this.idProduct, this.editCart = false})
      : super(key: key);

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {

  //untuk mencegah get data berulang ulang ketika halaman di render ulang dengan setstate()
  //trigernya ada di bagian then futurebuilder
  bool stopRefreshing = false;

  late Future<DetailProductResponse> detailProduct;
  late Future<CheckCartResponse> checkCart;
  late String idUser;
  String idProduct = "";
  String nameProduct = "";
  String nameCategory = "";
  String descProduct = "";
  String imageProduct = "";
  String stockProduct = "";
  String response = "";
  int priceProduct = 0;
  int totalPrice = 0;
  int status = 0;
  int itemCount = 0;



  checkCartUser(){
    LoginPref.getValuePref().then((value) async{
      //ambil id user
      idUser = await value['id_user']!;

      setState(() {
        //cek apakah ada item di keranjang
        //masukan idUser idProduct
        checkCart = Api.checkCart(idUser, widget.idProduct);
      });

      //ketika sudah ada data, maka atur itemCount sesuai dengan
      //jumlah item product yang ada di webservice
      checkCart.then((value) {
        //update variabel item countnya
        itemCount = int.parse(value.result!.quantity!);
      });
    });
  }

  Widget loadingData() {
    return FutureBuilder(
      future: detailProduct,
        builder: (context, AsyncSnapshot<DetailProductResponse> snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            stopRefreshing = true;

            idProduct = snapshot.data!.idProduct!;
            nameProduct = snapshot.data!.nameProduct!;
            nameCategory = snapshot.data!.nameCategory!;
            descProduct = snapshot.data!.descProduct!;
            imageProduct = snapshot.data!.imageProduct!;
            stockProduct = snapshot.data!.stockProduct!;
            priceProduct = int.parse(snapshot.data!.priceProduct!);
            status = snapshot.data!.status!;
            response = snapshot.data!.response!;
            totalPrice = int.parse(snapshot.data!.priceProduct!);

            return showDetail();
          } else if (snapshot.hasError) {
            stopRefreshing = false;
            return Center(
              child: Text("Data is unavailable, please chechk your connection"),
            );
          } else {
            stopRefreshing = false;
            return Center(
                child: CircularProgressIndicator()
            );
          }
        });
  }

  Widget showDetail() {
    double maxWidth = MediaQuery
        .of(context)
        .size
        .width;
    double maxHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      width: maxWidth,
      height: maxHeight,
      child: Column(
        children: [
          Image.network(
            Api.IMAGE_URL + imageProduct,
            height: 300,
            width: double.infinity,
          ),

          SizedBox(
            height: 10,
          ),
          DetailProductItem(
            descProduct: descProduct,
            priceProduct: priceProduct,
            nameProduct: nameProduct,
            stockProduct: stockProduct,
            nameCategory: nameCategory,
          ),

          SizedBox(
            height: 10,
          ),

          Description(
            desc: descProduct,
          ),
          setQuantity(),
          SizedBox(
            height: 10,
          ),
          (widget.editCart)
              ? Center(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                onPressed: () {
                  Api.updateCart({
                    "id_user": idUser,
                    "id_product": idProduct,
                    "quantity": itemCount.toString(),
                  }).then((value) {
                    Utils.showMessage(
                        "your item changed successfully", context
                    );
                    setState(() {

                    });
                  });
                },
                child: Text("Edit Cart"),
              ),
            ),
          ) : SizedBox(),

          Expanded(child: SizedBox()),

          Footer(
            totalPrice: totalPrice,
            editCart: widget.editCart,
            idProduct: widget.idProduct,
            qty: itemCount,
          ),
        ],
      ),
    );
  }


  Widget setQuantity() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          //kurangi jumlah barang
          ElevatedButton(onPressed: () {
            setState(() {
              //proses decrement/pengurangan
              itemCount --;
              //kondisi ini akan mencegah adanya nilai negatif ada variabel
              if (itemCount <= 0) {
                itemCount = 1;
              }
              //membuat total dari beberapa item yang akan dimasukan ke dalam cart
              totalPrice = priceProduct * itemCount;
            });
          },
            style: ElevatedButton.styleFrom(
                shape: CircleBorder(), primary: Colors.grey[200]),
            child: Icon(
              Icons.horizontal_rule,
              size: 20,
            ),
          ),
          Text(
            itemCount.toString(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              itemCount++;
              totalPrice = priceProduct * itemCount;
            });
          },
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(), primary: Colors.green[400]),
            child: Icon(Icons.add, size: 20, color: Colors.white,
            ),
          ),
        ],
      ),
    );


  }

  @override
  void initState() {
    detailProduct = Api.getDetailProduct(widget.idProduct);
    checkCartUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (stopRefreshing == false) ? loadingData() : showDetail(),
      ),
    );
  }
}
