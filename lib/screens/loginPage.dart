import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> _CreateUser() async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch(e){
      print("Error:$e");
    }catch(e){
      print("Error:$e");
    }
  }
  Future<void> _Login() async{
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch(e){
      print("Error:$e");
    }catch(e){
      print("Error:$e");
    }
  }
  String _email;
  String _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple,
        title: Text("Login "),
      ),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
         
          children: [
            TextField(
              onChanged: (value){
                _email=value;
              },
              decoration: InputDecoration(
                hintText: "Enter Your E-mail Here.."
              ),
            ),
            TextField(
              onChanged: (value){
                _password=value;
              },
              decoration: InputDecoration(
                hintText: "Enter Your Password Here.."
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(child: Text("Login"),
                onPressed: _Login,
                )
                ,
                MaterialButton(child: Text("Create New Account"),
                onPressed: _CreateUser,
                ),
              ],
            )

          ],
        ),
      ),
      
    );
  }
}