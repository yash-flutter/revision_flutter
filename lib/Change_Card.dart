import 'package:flutter/material.dart';
import 'package:revision_flutter/bg_image.dart';

class ChangeCard extends StatelessWidget {
  const ChangeCard({
    Key key,
    @required this.mytext,
    @required TextEditingController namecontroller,
  }) : _namecontroller = namecontroller, super(key: key);

  final String mytext;
  final TextEditingController _namecontroller;

  @override
  Widget build(BuildContext context) {
    return Card(
              child: Column(
              
              children: [
                BgImage(),
                SizedBox(height: 20,),

                Text(mytext,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,)),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                        obscureText: true,
                        controller: _namecontroller,
                        decoration: InputDecoration(hintText: "Enter SomeThing Here",
                        labelText: "Name",
                        border: OutlineInputBorder()
                        ),
                      ),
                ),
              ],
            ),
          );
  }
}