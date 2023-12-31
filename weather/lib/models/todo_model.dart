class Todo {
  int id;
  String title;
  bool isDone;
  double long;
  double lat;

  Todo({
    required this.id,
    required this.title,
    required this.isDone,
    required this.long,
    required this.lat
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone ? 1 : 0,
      'long': long,
      'lat': lat
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      isDone: map['isDone'] == 1,
      long: map['long'],
      lat: map['lat']
    );
  }
}
