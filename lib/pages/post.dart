import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Post extends StatefulWidget {
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  bool isLoaded = true;
  String prblmtitle;
  String explanation;
  String name;
  String photoUrl;

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
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

  void uploaddata() {}

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above
    if (isLoaded) {
      return Container(
        color: Color(0xFF121212),
        child: Container(
          //color: Color.fromRGBO(255, 255, 255, 200),
          //alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
              ),
              Container(
                child: Card(
                  color: Color(0xFF2e2e2e),
                  child: TextField(
                    onChanged: (text) {
                      prblmtitle = text;
                    },
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: 20.0, color: Color(0xFF565656)),
                      labelStyle:
                          TextStyle(fontSize: 20.0, color: Color(0xFFcacaca)),
                      icon: const Icon(
                        Icons.title,
                        color: Color(0xFF6200ee),
                      ),
                      hintText: 'Problem Title',
                      labelText: 'Title',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                //explain textfield container
                child: Card(
                  color: Color(0xFF2e2e2e),
                  //explain texfield card

                  elevation: 5,

                  shadowColor: Colors.blueGrey,
                  child: Column(
                    children: <Widget>[
                      TextField(
                        onChanged: (text) {
                          explanation = text;
                        },
                        cursorColor: Colors.white,
                        //explain textfield

                        maxLines: 15,
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.multiline,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Color(0xFF565656)),
                          labelStyle: TextStyle(
                              fontSize: 20.0, color: Color(0xFFcacaca)),
                          fillColor: Colors.white,
                          icon: const Icon(
                            Icons.toc,
                            color: Color(0xFF6200ee),
                          ),

                          hintText: 'Explain the problem',

                          focusedBorder: InputBorder.none,

                          enabledBorder: InputBorder.none,

                          errorBorder: InputBorder.none,

                          disabledBorder: InputBorder.none,

                          //labelText: 'Phone',
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: OutlineButton(
                          borderSide: BorderSide(color: Color(0xFF6200ee)),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          color: Colors.white,
                          textColor: Color(0xFF6200ee),
                          child: const Text('Ask'),
                          onPressed: () async {
                            DocumentReference ref =
                                await _db.collection("posts").add({
                              'Title': prblmtitle,
                              'Explanation': explanation,
                              'date': DateTime.now(),
                              'photourl': photoUrl
                            });
                            //  print(prblmtitle + '    ' + explanation);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Loading'),
        ),
      );
    }
  }
}
