import 'package:flutter/material.dart';
import 'package:midterm/model/cat.dart';
import 'package:midterm/screens/form.dart';
import 'package:provider/provider.dart';


class CatDetail extends StatefulWidget {

  static const routeName = '/cat-detail';

  @override
  State<CatDetail> createState() => _CatDetailState();
}

class _CatDetailState extends State<CatDetail> {
  @override
  Widget build(BuildContext context) {
    final catName = ModalRoute.of(context).settings.arguments as String;
    final loadedCts = Provider.of<Cats>(context).findByCatName(catName);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedCts.catname),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Padding(padding:
            const EdgeInsets.all(10),
            child: Image.asset(loadedCts.imgfile),
            ),
          ),
        Text('พันธุ์: ${loadedCts.type}', style: TextStyle(
          fontSize: 20,
        ),),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text('เพศ: ${loadedCts.gender}', style: TextStyle(
            fontSize: 20,),
          ),),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text('สี: ${loadedCts.catcolor}', style: TextStyle(
            fontSize: 20,
          ),),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text('วันที่หาย: ${loadedCts.lostdate}', style: TextStyle(
            fontSize: 20,
          ),),
          ),
        Padding(
          padding: const EdgeInsets.all(5), 
          child: Text('สถานที่หาย: ${loadedCts.location}', style: TextStyle(
            fontSize: 20,
            ),),
        )
        ],
      ),
    floatingActionButton: FloatingActionButton.extended(
      onPressed: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
          builder: (context) => FormPage(),
          ),
        );
      }, 
      icon: Icon(Icons.message_sharp,size: 30,),
      backgroundColor: Colors.deepOrange[200],
      label: Text('Found your cat!',style: TextStyle(color: Colors.white),),
    ), 
    );
  }
}