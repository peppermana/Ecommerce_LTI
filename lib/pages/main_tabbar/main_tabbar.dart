import 'package:e_commerce/constants/font_constants.dart';
import 'package:e_commerce/pages/about/about.dart';
import 'package:e_commerce/pages/feed_page/feed_page.dart';
import 'package:e_commerce/pages/help_page/help_page.dart';
import 'package:e_commerce/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

class MainTabbar extends StatefulWidget {
  const MainTabbar({Key? key}) : super(key: key);

  @override
  _MainTabbarState createState() => _MainTabbarState();
}

class _MainTabbarState extends State<MainTabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Ecommerce', style: FontConstants.headerTitle),
          actions: [
            //icon di appbar untuk keranjang
            IconButton(
              onPressed: () {
                // Navigator.of(context)
                // .push(MaterialPageRoute(builder: (context) => CartPage()));
              },
              icon: Icon(Icons.shopping_cart),
              color: Colors.white,
            ),
            PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              itemBuilder: (itmcontext) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text("My Profile"),
                ),
              ],
              onSelected: (item) {
                switch (item) {
                  case 0:
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (context) => ProfilePage()));
                    break;
                  default:
                    break;
                }
              },
            ),
          ],
        ),
        body: TabBarView(children: [
          HomePage(),
          FeedPage(),
          HelpPage(),
          AboutPage(),
        ]),
        bottomNavigationBar: TabBar(
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.orange,
          tabs: [
            Tab(icon: Icon(Icons.home_outlined), text: "home"),
            Tab(icon: Icon(Icons.feed_outlined), text: "Feeds"),
            Tab(icon: Icon(Icons.help_outline_outlined), text: "help"),
            Tab(icon: Icon(Icons.person_outline_outlined), text: "about")
          ],
        ),
      ),
    );
  }
}
