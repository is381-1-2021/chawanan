import 'package:flutter/material.dart';

class blank5 extends StatefulWidget {
  @override
  State<blank5> createState() => _blank5State();
}

class _blank5State extends State<blank5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('contact us',),
      ),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text('เบอร์ติดต่อ : 099-999-9999', style: TextStyle(fontSize: 15),
            ),
            Text('e-mail : catwhat@gmail.com', style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      )),  
    );
  }
}