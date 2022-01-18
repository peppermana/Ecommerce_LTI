import 'package:e_commerce/api/api.dart';
import 'package:e_commerce/api/feed/feed_response.dart';
import 'package:e_commerce/constants/font_constants.dart';
import 'package:e_commerce/pages/feed_page/widget/feed_list.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  Future <FeedResponse>listFeed = Api.getFeed();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
          child: Text(
            "Feeds",
            style: FontConstants.title,
          ),
        ),
        FutureBuilder(
          future: listFeed,
          builder: (context, AsyncSnapshot<FeedResponse> snapshot){
            if(snapshot.hasData){
              return FeedList(listFeed: snapshot.data!.data!);
            } else if(snapshot.hasError){
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: Text("oops! something wrong"),
                ),
              );
            }else{
              return CircularProgressIndicator();
            }
          }
        ),
      ],
    );
  }
}
