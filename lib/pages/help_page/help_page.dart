import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         actions: [
           IconButton(
             onPressed: (){

             },icon: Icon(Icons.person_outline_outlined),
             color: Colors.white,
           ),
           Text("Help"),
         ],
      ),

      body: Container(
        child: Column(
          children: [

          ],
        )
      ),
    );
  }
}
