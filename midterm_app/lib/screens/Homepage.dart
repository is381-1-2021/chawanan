import 'package:flutter/material.dart';
import 'package:midterm/screens/home.dart';
import '../widgets/allcat.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
   floatingActionButton: FloatingActionButton.extended(
      onPressed: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
          builder: (context) => RealHomepage(),
          ),
        );
      }, 
      icon: Icon(Icons.home,size: 30,),
      backgroundColor: Colors.deepOrange[200],
      label: Text('Back to Home Page',style: TextStyle(color: Colors.white),),
    ),
    );
  }
}