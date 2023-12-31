import 'package:flutter/material.dart';
import 'package:weather/detail.dart';
import 'models/todo_model.dart';
import 'providers/todo_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color.fromARGB(255, 53, 130, 152),
      debugShowCheckedModeBanner: false,
      title: 'Weathet app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TodoProvider todoProvider = TodoProvider();
  final TextEditingController _textEditingController = TextEditingController();
  List<Todo> _todos = [];
  late Future<List<Todo>> futureTodo;

  @override
  void initState() {
    super.initState();
    // _loadTodos();
    futureTodo = _loadTodos(); // Assign the Future in initState
  }

  Future<List<Todo>> _loadTodos() async {
    List<Todo> todos = await todoProvider.getTodos();
    setState(() {
      _todos = todos;
      
    });
    return todos;
  }

  Future<void> _addTodo() async {
    String title = _textEditingController.text;
    if (title.isNotEmpty) {
      Todo newTodo = Todo(id: 0, title: title, isDone: false, long: 0.0, lat: 0.0);
      await todoProvider.insertTodo(newTodo);
      _textEditingController.clear();
      // _loadTodos();
      setState(() {
        futureTodo = _loadTodos(); // Update the Future when adding a new todo
      });
    }
  }

  Future<void> _toggleTodoStatus(Todo todo) async {
    todo.isDone = !todo.isDone;
    await todoProvider.updateTodo(todo);
    // _loadTodos();
    futureTodo = _loadTodos();
  }

  Future<void> _deleteTodo(Todo todo) async {
    await todoProvider.deleteTodo(todo.id);
    // _loadTodos();
    futureTodo = _loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 130, 152),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 53, 130, 152),
        title: Text('Weather app for farmers'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Todo>>(
            future: futureTodo,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) {
                    final todo = snapshot.data![index];
                    return Dismissible(
                      key: ValueKey(snapshot.data![index].id),
                      direction: DismissDirection.startToEnd,
                      onDismissed: (direction){
                        setState(() {
                          _deleteTodo(snapshot.data![index]);
                          _todos.removeAt(index); // Remove the item from the local list
                        });
                      },
                      
                      confirmDismiss: (direction) async {
                        final result = await showDialog(
                          context: context,
                          builder: (_) => NoteDelete()
                        );
                        return result;
                      },

                      background: Container(
                        color: Color(0xFF9E949B),
                        padding: const EdgeInsets.only(left: 16),
                        child: const Align(child: Icon(Icons.delete, color:Colors.white),alignment: Alignment.centerLeft,),
                      ),
                      
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => AppDetail(name: snapshot.data![index].title, lat: snapshot.data![index].lat, long: snapshot.data![index].long )));
                          
                        },
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(125, 115, 119, 1),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data![index].title,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    );
                  } 
                );
              } else {
                  return const Center(child: CircularProgressIndicator());
                }
            },
          ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
            title: Text('Add a new farm'),
            content: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter the farm name ',
              ),
            ),
            actions: <Widget>[
              FloatingActionButton(
                child: const Text('Add'),
                onPressed: (){
                  _addTodo();
                  Navigator.of(context).pop(true);
                },
              ),
              FloatingActionButton(
                child: const Text('Cancel'),
                onPressed: (){
                  _textEditingController.clear();
                  Navigator.of(context).pop(false);
                },
              ),
            ]
            
          ),
          );
          
        },
        tooltip: 'Add a new farm',
        child: const Icon(Icons.add),
      ), 
    );
  }
}


class NoteDelete extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('warning'),
      content: Text('Are you sure want to delete this?'),
      actions: <Widget>[
        FloatingActionButton(
          child: const Text('Yes'),
          onPressed: (){
            Navigator.of(context).pop(true);
          },
        ),
        FloatingActionButton(
          child: const Text('No'),
          onPressed: (){
            Navigator.of(context).pop(false);
          },
        ),
      ]
      
    );
  }
}