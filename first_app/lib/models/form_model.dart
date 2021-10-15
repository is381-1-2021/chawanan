import 'package:flutter/material.dart';

class FormModel extends ChangeNotifier {
  String? _firstName;
  String? _lastName;
  int? _age;
  
  get firstName => _firstName;

  set firstName(value) {
    _firstName = value;
    notifyListeners();
  } 

  get lastName => _lastName;

  set lastName(value) {
    _lastName = value;
    notifyListeners();
  }

  get age => _age;

  set age(value) {
    _age = value;
    notifyListeners();
  }
}
