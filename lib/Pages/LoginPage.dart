import 'package:flutter/material.dart';
import 'package:revision_flutter/bg_image.dart';
import 'package:revision_flutter/utils/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),),
      body: Stack(
        fit: StackFit.expand,
        children: [
        BgImage(),
        Center(
          child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Card(
                        child: Column(children: [
                Form(child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter UserName",
                          labelText: "Username"
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password"
                          
                        ),
                      )
                    ],),
                ),),
                  RaisedButton(onPressed: () {
                    Constants.prefs.setBool("loggedIn", true);
                    Navigator.pushReplacementNamed(context, "/home");
                  },
                  child: Text("Sign In"),
                  color: Colors.orange,
                  textColor: Colors.white,)
              ],),
            ),
          ),
      ),
        ),
      ],)
    );
  }
}