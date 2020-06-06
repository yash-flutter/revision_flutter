import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:revision_flutter/Pages/homepage.dart';

void main()
{
  runApp(MaterialApp(
      title: "Awesome App",
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.cyan), 
      )
  );
}