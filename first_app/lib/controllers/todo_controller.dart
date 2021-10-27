//คอย manage ถ้ายังไม่มาจะขึ้นหมุน ๆ progress bar เป็น streamcontroller
import 'dart:async';

import 'package:first_app/models/todo_model.dart';
import 'package:first_app/services/services.dart';

class TodoController {
  final HttpServices services; //ตัวแปร
  List<Todo> todos = List.empty(); //ตัวแปร //list.empty ไม่ null

  StreamController<bool> onSyncController = StreamController(); //ตัวแปร
  Stream<bool> get onSync => onSyncController.stream; //ตัวแปร
  //เป็น getter

  TodoController(this.services); //function

  Future<List<Todo>> fetchTodos() async { //function fetchTodos
    onSyncController.add(true); //เพื่อให้รู้ว่าทำงานเสร็จไปหรือยัง ให้มีหน้าหมุนรอ เริ่มดึงข้อมูล กำลัง progress
    todos = await services.getTodos(); //ดึง todos จาก online //getTodos เป็น future
    // call todos ต้อง await เพื่อให้เป็น todos ธรรมดา
    onSyncController.add(false); //ดึงข้อมูลเสร็จแล้ว

    return todos; //โยนค่ากลับให้ ui ใช้งาน
  }
}