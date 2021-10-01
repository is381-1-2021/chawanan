import 'package:flutter/material.dart';
import '../widgets/allcat.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cat What'),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20,),
          Center(child: Text('Find My Cat', 
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
          SizedBox(height: 5,),
          Container(
            height: 600,
            child: AllCats())
        ],
      ),
    );
  }
}