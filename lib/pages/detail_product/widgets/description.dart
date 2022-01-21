import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String desc;
  const Description({Key? key, required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("description", style: TextStyle(
            fontWeight: FontWeight.w400, fontSize: 24,
          ),),
          SizedBox(
            height: 10
          ),
          Text(desc, maxLines: 3, overflow: TextOverflow.ellipsis,),
          TextButton(onPressed: (){

          }, child: Text("liat selengkapnya"),),
        ],
      ),
    );
  }
}
