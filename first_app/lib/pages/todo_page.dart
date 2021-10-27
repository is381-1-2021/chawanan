import 'package:first_app/controllers/todo_controller.dart';
import 'package:first_app/models/todo_model.dart';
import 'package:flutter/material.dart';


class TodoPage extends StatefulWidget { 
  final TodoController controller; //ประกาศตัวแปร เพราะตอนสร้างหน้าเพจต้องโยน controller

  const TodoPage({required this.controller}); //เรียก

  @override
  _TodoPageState createState() => _TodoPageState();
 }

class _TodoPageState extends State<TodoPage> {
  List<Todo> todos = List.empty();
  bool isloading = false; //ตัวแปร

  void initState() {
    super.initState();

    widget.controller.onSync.listen( //ถ้ามีการเรียก controller เมื่อไรก็ตาม ให้เรียกฟังก์ชันตรงนี้ด้วย
      (bool syncState) => setState(() => isloading = syncState),
    );
  }
 
  void _getTodos() async {
    var newTodos = await widget.controller.fetchTodos(); //ดึงค่ามาเป็น future   

    setState(() => todos = newTodos);
  }
  Widget get body => isloading //เช็คว่า loading มั้ย 
    ? CircularProgressIndicator() // หลัง ? เป็น true เสมอ
    : ListView.builder( // false
      itemCount: todos.isEmpty ? 1 : todos.length, //ถ้า empty เป็น 1
      itemBuilder: (ctx, index) { //รับเป็น function
        if (todos.isEmpty) {
          return const Text('Tap button to fetch todos');
        }

        return CheckboxListTile( //ถ้าไม่ empty
          onChanged: null, 
          value: todos[index].completed,
          title: Text(todos[index].title),
          );
        },
      );
      
@override 
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('HTTP Todos'),
    ),
    body: Center(child: body),
    floatingActionButton: FloatingActionButton( //ปุ่มสำหรับดึงข้อมูล
      onPressed: _getTodos, //เรียก getTodos
      child: const Icon(Icons.add),
    ),
  );
}   
}