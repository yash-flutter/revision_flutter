import 'package:flutter/material.dart';
import 'package:revision_flutter/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Awesome App"),),
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
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text(data[index]["title"],),
                            leading: Image.network(data[index]["url"]),
                            
            );
           },
          ),
        ):Center(child: CircularProgressIndicator()),
      ),    
    );
  }
}
