import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: MaterialButton(child: Text("Sign out"),
        onPressed: ()async{
          await FirebaseAuth.instance.signOut();
           
        },
        ),
      ),
      
    );
  }
}