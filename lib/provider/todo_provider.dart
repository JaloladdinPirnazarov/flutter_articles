import 'package:flutter/foundation.dart';
import 'package:flutter_articles/services/todo_service.dart';

import '../model/todo.dart';

class TodoProvider extends ChangeNotifier{
  TodoService _service = TodoService();
  bool isLoading = false;
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future<void> getAllTodos()async{
    isLoading = true;
    notifyListeners();
    final _response = await _service.getAll();
    _todos = _response;
    isLoading = false;
    notifyListeners();
  }
}