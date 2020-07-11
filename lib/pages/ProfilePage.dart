import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name;
  String photoUrl;

  bool isLoaded = false;

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfileData();
  }

  void getProfileData() async {
    try {
      FirebaseUser user = await _auth.currentUser();

      DocumentSnapshot doc =
          await _db.collection("users").document(user.uid).get();

      setState(() {
        name = doc.data["displayname"];
        photoUrl = doc.data["photourl"];
        isLoaded = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoaded) {
      return Container(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(170),
                  // child: Image(
                  //   image: NetworkImage(photoUrl),
                  // ),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(170),
                              child: Image(
                                image: NetworkImage(photoUrl),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            child: Text(
                              "DisplayName : " + name,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        // Center(
                        //   child: Container(
                        //     child: Text(
                        //       "Login Time : " + name,
                        //       style: TextStyle(fontSize: 20),
                        //     ),
                        //   ),
                        // ),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('Logout'),
                              onPressed: () {
                                FirebaseAuth.instance.signOut();
                              },
                            ),
                            // FlatButton(
                            //   child: const Text('LISTEN'),
                            //   onPressed: () {/* ... */},
                            // ),
                          ],
                        ),
                        // RaisedButton(
                        //   onPressed: () {
                        //     FirebaseAuth.instance.signOut();
                        //   },
                        //   child: Text("Log out"),
                        // ),
                      ],
                    ),
                  )),
            ],
          ));
    } else {
      return Container(
        child: Text("Loading"),
      );
    }
  }
}
