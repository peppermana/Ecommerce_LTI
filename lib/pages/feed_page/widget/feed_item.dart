import 'package:e_commerce/api/api.dart';
import 'package:e_commerce/api/feed/feed_response.dart';
import 'package:flutter/material.dart';


class FeedItem extends StatelessWidget {

  final Data feedItem;

  const FeedItem({Key? key, required this.feedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        child: Column(
          children: [
            Image.network(
              Api.IMAGE_URL + feedItem.imageFeed!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 130,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                return Image.asset(
                  "assets/noimageplaceholder.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 130,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
