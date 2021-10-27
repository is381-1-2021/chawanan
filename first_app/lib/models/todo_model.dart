class Todo {
  final int userID;
  final int id;
  final String title;
  bool completed;

Todo(this.userID, this.id, this.title, this.completed);

factory Todo.formJson(  //function ผูกกับชื่อคลาส ประกาศชื่อ formJson
  Map<String, dynamic> json, //เอา Map มา return function Todo
) {
  return Todo(
    json['userId'] as int,
    json['id'] as int,
    json['title'] as String,
    json['completed'] as bool,
  );
}
}

class AllTodos { //มาหุ้ม todo เพื่อบอกว่า todo ทั้งหมดทำอะไร
  final List<Todo> todos;

  AllTodos(this.todos);

  factory AllTodos.fromJson(
    List<dynamic> json, //ตััวแปรพัก
  ){
    var x = json.map((record) => Todo.formJson(record)).toList(); //ตั้งชื่อ record ประกาศตัวแปร
    // .map เรียกข้อมูลที่ล๊อค โยนให้คลาสตัวย่อยทำงาน
    return AllTodos(x);
  }
}