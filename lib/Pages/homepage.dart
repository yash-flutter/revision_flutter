import 'package:flutter/material.dart';
import 'package:revision_flutter/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:revision_flutter/utils/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  TextEditingController _namecontroller = TextEditingController();
  
  var mytext="Change Me";
  var data;
  var url="https://jsonplaceholder.typicode.com/photos";

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async{
    var res= await http.get(url);
    data=jsonDecode(res.body);
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Awesome App"),
      actions: [
        IconButton(onPressed: (){
          Constants.prefs.setBool("loggedIn", false);
          Navigator.pushReplacementNamed(context, "/login");
        },
        icon: Icon(Icons.exit_to_app),)
      ],
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          mytext=_namecontroller.text;
          setState(() {
          });
        },
        child: Icon(Icons.edit),
        ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: data!=null?Card(
          child: ListView.builder(
            
            itemCount: data.length,
            padding: EdgeInsets.all(8),
            itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text(data[index]["title"],),
                            leading: Image.network(data[index]["url"]),
                            
            );
           },
          ),
        ):Center(child: CircularProgressIndicator(
          
        )     
        )
        ),    
    );
  }
}
