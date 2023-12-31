import 'package:sqflite/sqflite.dart';
import '../helpers/database_helper.dart';
import '../models/todo_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class TodoProvider {
  final dbHelper = DatabaseHelper.instance;
  late String long;
  late String lat;
  

  Future<int> insertTodo(Todo todo) async {
    Database db = await dbHelper.database;
    // Generate a unique identifier for the new todo
    todo.id = DateTime.now().millisecondsSinceEpoch;
    _checkLocationPermission();
    todo.long = double.parse(long);
    todo.lat = double.parse(lat);
    return await db.insert('todos', todo.toMap());
  }

  Future<List<Todo>> getTodos() async {
    Database db = await dbHelper.database;
    List<Map<String, dynamic>> maps = await db.query('todos');
    return List.generate(maps.length, (index) {
      return Todo.fromMap(maps[index]);
    });
  }

  Future<int> updateTodo(Todo todo) async {
    Database db = await dbHelper.database;
    return await db.update('todos', todo.toMap(),
        where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<int> deleteTodo(int id) async {
    Database db = await dbHelper.database;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }


  Future<void> _checkLocationPermission() async {
    var status = await Permission.location.status;
    if (status == PermissionStatus.granted) {
      _getLocation();
    } else {
      await _requestLocationPermission();
    }
  }

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      _getLocation();
    } else {
        print('Location permission denied');
    }
  }

  Future<void> _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
            lat = '${position.latitude}';
            long = '${position.longitude}';
    } catch (e) {
      print('Error: $e');
    }
  }
}
