import 'package:flutter/material.dart';
import 'package:midterm/main.dart';
import 'package:midterm/screens/Homepage.dart';
import 'package:midterm/screens/blank1.dart';
import 'package:midterm/screens/blank2.dart';
import 'package:midterm/screens/blank3.dart';
import 'package:midterm/screens/blank4.dart';
import 'package:midterm/screens/blank5.dart';

class RealHomepage extends StatelessWidget {
  get image => null;

  @override
  Widget  build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Cat What'),
      ),
    body: BodyLayout(),
            );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  return ListView(
    children: ListTile.divideTiles(context: context, tiles: [
      ListTile(
        title: Text('adopt cat'),
        leading: Icon(Icons.cabin_rounded, size: 30,),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => blank1()));
        },
      ),
      ListTile(
        title: Text('find my cat'),
        leading: Icon(Icons.add_location_alt_outlined, size: 30,),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Homepage()));
        },
      ),
      ListTile(
        title: Text('content'),
        leading: Icon(Icons.add_reaction_outlined, size: 30,),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => blank3()));
        },
      ),
      ListTile(
        title: Text('marketplace'),
        leading: Icon(Icons.shopping_basket_rounded, size: 30,),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => blank2()));
        },
      ),
    ListTile(
        title: Text('pet grooming'),
        leading: Icon(Icons.auto_awesome_rounded, size: 30,),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => blank4()));
        },
    ),
    ListTile(
        title: Text('contact us'),
        leading: Icon(Icons.phone_callback_rounded, size: 30,),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => blank5()));
        },
    ),
    ]).toList(),
  );
}