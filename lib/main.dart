import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:revision_flutter/Pages/LoginPage.dart';
import 'package:revision_flutter/Pages/homepage.dart';
import 'package:revision_flutter/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs= await SharedPreferences.getInstance();

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Awesome App",
      home: Constants.prefs.getBool("loggedIn")==true?HomePage():LoginPage(),
      theme: ThemeData(primarySwatch: Colors.cyan), 
      routes: {
        "/login":(context)=>LoginPage(),
        "/home":(context)=>HomePage()
      },
      )
  );
}