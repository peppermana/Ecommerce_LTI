import 'package:e_commerce/pages/main_tabbar/main_tabbar.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  void delayed(BuildContext context) {
    //jeda dulu 3 detik
    Future.delayed(Duration(seconds: 3), () async {
      //setelah jeda pindah ke halaman home page dan menghapus halaman ini
      //sehingga ketika dihapus, tidak bisa kembali lagi ke halaman splash screen

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainTabbar()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    delayed(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/logo2.png",
              width: 200,
              height: 200,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
