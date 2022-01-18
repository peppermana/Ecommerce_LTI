import 'package:e_commerce/pages/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';


void main(){
  runApp (MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce Lauwba',
          theme: ThemeData(
        primarySwatch: Colors.orange
    ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
