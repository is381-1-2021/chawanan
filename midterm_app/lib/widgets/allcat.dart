import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cat.dart';
import './cts.dart';

class AllCats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final catData=Provider.of<Cats>(context);
    final cts=catData.items;
    return GridView.builder(
     physics: ScrollPhysics(),
     itemCount: cts.length,
     padding: EdgeInsets.all(6.0),
     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
(crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 10), 
      itemBuilder: (ctx, i)=>ChangeNotifierProvider.value(
        value: cts[i],
      child: CtsItem(catname: cts[i].catname, imgfile: cts[i].imgfile,)),
    );
  }
}