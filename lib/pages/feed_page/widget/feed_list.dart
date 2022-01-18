import 'package:e_commerce/api/feed/feed_response.dart';
import 'package:flutter/material.dart';

import 'feed_item.dart';

class FeedList extends StatefulWidget {

  final List<Data> listFeed;

  const FeedList({Key? key, required this.listFeed}) : super(key: key);

  @override
  _FeedListState createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {



  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.listFeed.length,
          itemBuilder: (context, index){
             return FeedItem(feedItem: widget.listFeed[index]);
    }
      ),
    );
  }
}
