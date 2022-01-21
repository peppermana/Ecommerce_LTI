import 'package:e_commerce/api/api.dart';
import 'package:e_commerce/config/Utils.dart';
import 'package:e_commerce/config/currencyMoney.dart';
import 'package:e_commerce/config/login_pref.dart';
import 'package:e_commerce/pages/Login/login.dart';
import 'package:e_commerce/pages/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:need_resume/need_resume.dart';

class Footer extends StatefulWidget {
  final int totalPrice;
  final bool editCart;
  final String idProduct;
  final int qty;

  const Footer(
      {Key? key,
      required this.totalPrice,
      this.editCart = false,
      required this.idProduct,
      required this.qty})
      : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends ResumableState<Footer> {
  bool? isAllowed;

  checkPrefBeforeCart() async {
    LoginPref.checkpref().then((value) {
      this.isAllowed = value;
    });
  }

  addToCart(BuildContext context) {
    //ambil nilai dari sharedPref berupa id user
    LoginPref.getValuePref().then((value) {
      //add to cart
      //mempersiapkan nilai iduser, idproduct, quantity dan masukan dalam variabel data
      var data = {
        "id_user": value["id_user"]!,
        "id_product": widget.idProduct,
        "quantity": widget.qty.toString(),
      };

      //mulai menambahkan data ke keranjang
      Api.AddToCart(data).then((value) {
        //muncul pesan sukses
        Utils.showMessage("your item is added to cart", context);
        //pergi ke halaman ke cart page

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Cart()));
      });
    });
  }

  @override
  void initState() {
    checkPrefBeforeCart();
    super.initState();
  }

  @override
  void onResume() {
   setState(() {
     checkPrefBeforeCart();
   });
    super.onResume();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.grey, spreadRadius: 0.1, blurRadius: 5)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "total",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
              ),
              Text(
                CurrencyMoney.indRupiah.format(widget.totalPrice),
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
              ),
            ],
          ),
          Expanded(child: SizedBox()),
          (widget.editCart)
              ? SizedBox()
              : ElevatedButton(
                  onPressed: () {
                    //cek apakah variabel isAllowed adalah false (belum login)
                    //percabangan ini akan diabaikan ketika nilai dari isAllowed adalah true dan langsung loncat ke perintah selanjutnya
                    if (this.isAllowed == false) {
                      //maka muncul pesan ini dan pergike halam login dulu
                      Utils.showMessage(
                          "you have to login to this app", context);

                      push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );

                      return null;
                    }
                    addToCart(context);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.orange)),
                  child: Text(
                    "Add to cart",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Cart()));
            },
            child: Text(
              "Go to cart",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
