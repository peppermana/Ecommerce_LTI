import 'package:e_commerce/api/api.dart';
import 'package:e_commerce/config/Utils.dart';
import 'package:e_commerce/config/login_pref.dart';
import 'package:e_commerce/pages/Login/login.dart';
import 'package:e_commerce/pages/detail_product/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:need_resume/need_resume.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends ResumableState<Cart> {
  checkPrefBeforeCart() async {
    LoginPref.checkpref().then((value) {
      if (value == false) {
        Utils.showMessage("you have to login to this app", context);
        Navigator.of(context).pop();
        push(context, MaterialPageRoute(builder: (context) => Login()));
      }
    });
  }

  @override
  void initState() {
    checkPrefBeforeCart();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: loadingData()),
    );
  }

  Widget loadingData() {
    return FutureBuilder(
      future: getCart(),
      builder: (context, AsyncSnapshot<ListCartResponse> snapshot) {
        //print (snapshot has data => snapshot.hasData.toString ());
        if (snapshot.hasData) {
          // cek apakah cart itu berisi?
          if (snapshot.data!.result!.length > 0) {
            //jika iya maka muncul list cart dan set total cartnya
            setTotalCart(snapshot.data!.result!);
            //print (snapshot.data!.result![0].nameProduct);
            return showCart(snapshot.data!.result!);
          } else {
            //sebaliknya, muncul pesan no cart
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "No Cart Available, let's go shopping",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF002B5A)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new,
                          size: 14,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        }
      },
    );
  }

  Widget showCart(List<Result> listCart) {
    return Column(
      children: [
        TitlePage(),
        Expanded(
          child: showList(listCart),
        ),

        Footer(
          totalPrice: totalPrice,
          cartList: List.generate(
            listCart.length,
                (index) =>
            {
              "productName": listCart[index].nameProduct!,
              "price": listCart[index].priceProduct!,
              "quantity": listCart[index].quantity!,
            },
          ),
        ),
      ],
    );
  }

  Widget showList(List<Result> listCart) {
    return ListView.builder(
        itemCount: listCart.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 120,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 0.5,
                    blurRadius: 4,
                  ),
                ]
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Row(
                children: [
                  Image.network(
                    Api.IMAGE_URL + listCart[index].imageProduct!,
                    width: 120,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 5, left: 10),
                        child: Column(
                          children: [
                            Text(
                              ""
                            ),
                          ],
                        ),),)
                ],
              ),
            ),
          );
        });
  }
}
