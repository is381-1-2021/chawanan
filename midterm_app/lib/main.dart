import 'package:flutter/material.dart';
import 'package:midterm/model/cat.dart';
import 'package:midterm/screens/Homepage.dart';
import 'package:midterm/screens/catdetail.dart';
import 'package:midterm/screens/home.dart';
import './screens/home.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Cats(),
        )
      ],
      child: MaterialApp(
        title: 'Find my cat',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
          color: Colors.deepOrange[300],
        )),
        home: Homepage(),
        routes: {
          CatDetail.routeName: (ctx)=>CatDetail() 
        },
          
          
      ),
    );
  }
}