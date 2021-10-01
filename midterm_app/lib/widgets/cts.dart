
import 'package:flutter/material.dart';
import 'package:midterm/screens/catdetail.dart';
import 'package:provider/provider.dart';
import '../model/cat.dart';

class CtsItem extends StatelessWidget {
  final String catname;
  final String imgfile;

  CtsItem({this.catname, this.imgfile});
  @override
  Widget build(BuildContext context) {
    final cts = Provider.of<Cat>(context);
    return GestureDetector(
      onTap: (){
        Navigator.of(context)
        .pushNamed(CatDetail.routeName, arguments: cts.catname);
      },
      child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridTile(
        child: Image.asset(imgfile),
        footer: GridTileBar(
        title: Text(catname),
        backgroundColor: Colors.deepOrange[200].withOpacity(0.7),
        ),
      ),
      ),
    );
  }
}