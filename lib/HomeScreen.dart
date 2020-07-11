import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'pages/FeedPage.dart';
import 'pages/ProfilePage.dart';
import 'pages/post.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

int currentPage = 0;
var pages = [FeedPage(), ProfilePage()];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ask Problem |    post problem ➜"),
          centerTitle: false,
          actions: <Widget>[
            CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xff86929e),
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Post()));
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (i) {
            setState(() {
              currentPage = i;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.import_contacts), title: Text("feed")),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text("Profile"))
          ],
        ),
        body: pages[currentPage]);
  }
}
