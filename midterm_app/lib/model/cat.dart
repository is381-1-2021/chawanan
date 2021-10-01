
import 'package:flutter/material.dart';

class Cat with ChangeNotifier{
  final String catname;
  final String catcolor;
  final String type;
  final String location;
  final String imgfile;
  final String gender;
  final String lostdate;

  Cat(
  {@required this.catname, 
  @required this.catcolor, 
  @required this.type, 
  @required this.location, 
  @required this.imgfile,
  @required this.gender,
  @required this.lostdate});
}

class Cats with ChangeNotifier{
  List<Cat> _items=[
    Cat(
      catname:'บลอสซัม',
      catcolor:'สีส้ม-ขาว ตาสีเขียว',
      imgfile:'assets/cat1.jpg',
      location:'อารีย์ กทม.',
      type:'British Shorthair',
      gender:'หญิง',
      lostdate:'02/09/2021',),
    Cat(
      catname:'เฉาก๊วย',
      catcolor:'สีขาว-ดำ ตาสีเหลือง',
      imgfile:'assets/cat2.jpg',
      location:'ชิดลม กทม.',
      type:'พันธุ์ไทย',
      gender:'ชาย',
      lostdate:'05/09/2021',),
    Cat(
      catname:'เห็ด',
      catcolor:'สีขาว-ดำ หน้าดำ ตาสีฟ้า',
      imgfile: 'assets/cat3.jpg',
      location:'สีลม กทม.',
      type:'British shorthair',
      gender:'หญิง',
      lostdate:'05/09/2021',),
    Cat(
      catname:'โมจิ',
      catcolor:'สีขาวล้วน ตาสีฟ้า',
      imgfile:'assets/cat4.jpg',
      location:'คลองหนึ่ง ปทุมธานี',
      type:'ขาวมณี',
      gender:'หญิง',
      lostdate:'10/09/2021',),
    Cat(
      catname:'แจ็กพอต',
      catcolor:'สีดำล้วน ตาสีเหลือง',
      imgfile:'assets/cat5.jpg',
      location:'พระราม3 กทม.',
      type:'พันธุ์ไทย',
      gender:'ชาย',
      lostdate:'13/09/21',),
    Cat(
      catname:'โมโม',
      catcolor:'ลายส้มขาว ตาสีเหลือง',
      imgfile:'assets/cat6.jpg',
      location:'คลองสาน กทม.',
      type:'British Shorthair',
      gender:'หญิง',
      lostdate:'15/09/2021',),
  ];

List<Cat> get items {
  return[..._items];
}

  Cat findByCatName(String catname){
    return _items.firstWhere((cts) => cts.catname == catname);
  }
}