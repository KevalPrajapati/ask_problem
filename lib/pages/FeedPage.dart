import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  bool isLoading = true;
  Firestore _db = Firestore.instance;
  List<DocumentSnapshot> posts;
  DateTime now = DateTime.now();
  bool pressed = true;
  String btntxt = "more";
  int rot = 0;
  @override
  void initState() {
    super.initState();
    _fetchPosts();
    print(now);
  }

  _fetchPosts() async {
    try {
      QuerySnapshot snap = await _db
          .collection("posts")
          .orderBy("date", descending: true)
          .getDocuments();
      setState(() {
        posts = snap.documents;
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        child: LinearProgressIndicator(),
      );
    } else {
      return Container(
        color: Color(0xFF1e1f24),
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (ctx, i) {
            String fulltext = posts[i].data["Explanation"];
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 5,
              ),
              child: Card(
                color: Color(0xFF2d2d2d),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(170),
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image(
                              image: NetworkImage(posts[i].data["photourl"]),
                            ),
                          )),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        posts[i].data["Title"] ?? " No Title",
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 100),
                        ),
                      ),
                    ),
                    Text(
                      posts[i].data["Explanation"] ?? "No Explanation",
                      overflow: pressed
                          ? TextOverflow.ellipsis
                          : TextOverflow.visible,
                      style:
                          TextStyle(color: Color.fromRGBO(255, 255, 255, 100)),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        Transform.rotate(
                          angle: rot * pi / 180,
                          child: IconButton(
                            icon: Icon(Icons.details),
                            onPressed: () {
                              setState(() {
                                if (pressed) {
                                  rot = 180;
                                } else {
                                  rot = 0;
                                }
                                pressed = !pressed;
                              });
                              //more
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
