import 'package:flutter/material.dart';
import 'screens/bottom_nav_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:safetag/screens/loginPage.dart';
import 'package:safetag/screens/homePage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => HomeScreen(),
      //   '/chatBot':(context)=>ChatBot(),
      // },
      //Only below this..................
      debugShowCheckedModeBanner: false,
      // title: 'SafeTag',
      // theme: ThemeData(
      // primarySwatch: Colors.blue,
      // scaffoldBackgroundColor: Colors.white,
      //  visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      // home: BottomNavScreen(),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(appBar: AppBar(backgroundColor: Colors.deepPurple,),
              body: Center(
                child: Text("Error:${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  User user = snapshot.data;
                  if (user == null) {
                    return LoginPage();
                  } else {
                    return MaterialApp(
                       debugShowCheckedModeBanner: false,
      title: 'SafeTag',
      theme: ThemeData(
      primarySwatch: Colors.deepPurple,
      scaffoldBackgroundColor: Colors.white,
       visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BottomNavScreen(),

                    );
                  }
                }
                return Scaffold(
                  body: Center(
                    child: Text("checking Authentication..."),
                  ),
                );
              },
            );
          }
          return Scaffold(
            body: Center(
              child: Text("Connecting to the App"),
            ),
          );
        });
  }
}
