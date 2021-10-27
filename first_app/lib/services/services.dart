import 'dart:convert';

import 'package:first_app/models/todo_model.dart';
import 'package:http/http.dart';

class HttpServices {
  Client client = Client(); //ตัวนี้ไปเรียก url 

  Future<List<Todo>> getTodos() async { //async return เป็น future เท่านั้น
    final response = await client.get( //await ดึงข้อมูลให้เสร็จค่อยแสดง
                      Uri.parse('https://jsonplaceholder.typicode.com/todos'),
                    );

    if (response.statusCode != 200) { //error 500 ทุกอย่างโอเค = 200
      throw Exception('Failed to load todos'); //คำสั่งโยน error = throw exception
    }

    var all = AllTodos.fromJson(json.decode(response.body)); //decode ด้วยคำสั่ง json.decode ถอดรหัสข้อมูลโยนไป AllTodos แกะข้อมูลออกมา

    return all.todos;
  }
}