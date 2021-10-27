import 'package:first_app/controllers/todo_controller.dart';
import 'package:first_app/pages/eight_page.dart';
import 'package:first_app/pages/todo_page.dart';
import 'package:first_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/form_model.dart';
import 'pages/fifth_page.dart';
import 'pages/first_page.dart';
import 'pages/fourth_page.dart';
import 'pages/second_page.dart';
import 'pages/seventh_page.dart';
import 'pages/sixth_page.dart';
import 'pages/third_page.dart';

void main() {
  var services = HttpServices();
  var controller = TodoController(services);
  
  runApp(TodoApp(controller: controller));
}

class TodoApp extends StatelessWidget {
  final TodoController controller;
  TodoApp({required this.controller});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoPage(controller: controller),
    );
  }
}

void main_old() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => FormModel(),     
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.amber,),
        primaryColor: Colors. amber,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.purple),
        ),
      ),
      initialRoute: '/5',
      routes: <String, WidgetBuilder> {
        '/1' : (context) => FirstPage(),
        '/2' : (context) => SecondPage(),
        '/3' : (context) => ThirdPage(),
        '/4' : (context) => FourthPage(),
        '/5' : (context) => FifthPage(),
        '/6' : (context) => SixthPage(),
        '/7' : (context) => SeventhPage(),
        '/8' : (context) => EightPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Image cat1 = Image.asset('lib/assets/popcat1.png', width: 120);
  Image cat2 = Image.asset('lib/assets/popcat2.png', width: 120);

  Image catOnShow = Image.asset('lib/assets/popcat1.png', width: 120);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200.0,
              width: 200.0,
              margin: const EdgeInsets.only(bottom: 50.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration( 
                color: Colors.blue.withOpacity(0.25),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: catOnShow,
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      catOnShow = cat1;
                      _counter--;
                    });
                  },
                  child: const Text('ลด'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      catOnShow = cat2;
                      _counter++;
                    });
                  },
                  child: const Text('เพิ่ม'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}