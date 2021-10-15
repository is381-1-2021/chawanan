import 'package:flutter/material.dart';

class FormPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('I Found Your Cat!'),
      ),
      body: FoundFormPage(),
      );
  }
}

class FoundFormPage extends StatefulWidget {
  @override
  _FoundFormPage createState() => _FoundFormPage();
}

class _FoundFormPage extends State<FoundFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _nameofcat = '';
  String _name = '';
  String _where = '';
  String _tel = '';
  int _age = 20;
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: 'ชื่อน้องแมวที่เจอ',
            labelText: 'Cat name',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter Cat Name.';
            }
          },
          onSaved: (value) {
            _nameofcat = value!;
          },
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'ชื่อคนใจดีที่พบแมว',
            labelText: 'Your Name',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter Your Name.';
            }
          },
          onSaved: (value) {
            _name = value!;
          },
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'สถานที่พบน้อง',
            labelText: 'Location',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter Location.';
            }
           },
          onSaved: (value) {
            _where = value!;
          },
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'อายุ',
            labelText: 'Age',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter age.';
            }

            try {
             if(int.parse(value) < 15) {
              return 'Please enter valid age => 15+'; 
            }
          } catch (e) {
            return 'Please enter number only';
            }

            var a = null;
            var b = '';
          },
          onSaved: (value) {
            _age = int.parse(value!);
          },
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'เบอร์ติดต่อ',
            labelText: 'Phone Number',
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Phone Number is required';
            }
          },
          onSaved: (value) {
            _tel = value!;
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.deepOrange[200],
          ),
        child: Text('Submit',style: TextStyle(color: Colors.white),),
          onPressed: () {
            final isValid = _formKey.currentState.validate();
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
        
            final message = 'catname: $_nameofcat\nname: $_name\nwhere: $_where\ntel: $_tel\nage $_age';
            final snackBar = SnackBar(
              content: Text(
              message,
              style: TextStyle(fontSize: 15),),
              backgroundColor: Colors.deepOrange[300],
            );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
 var response = '$_nameofcat $_name $_where $_tel $_age';
          
            Navigator.pop(context, response); 
          }  
        ),
        ],
      ),
    );
  }
}