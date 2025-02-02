import 'package:flutter/material.dart';
import 'package:flutter_module_3/helper/app_url.dart';
import 'package:flutter_module_3/helper/network_helper.dart';
import 'package:flutter_module_3/models/todo_model.dart';
import 'package:flutter_module_3/services/services.dart';

class TodoViewModel extends ChangeNotifier{
  List <TodoModel> _todoModel =[];
  List<TodoModel> get todoModel => _todoModel;

  setTodoModel (List<TodoModel> todoModdel) {
    _todoModel = todoModdel;
    notifyListeners();
  }


  getTodoResponse ()async {
    var finalResponse = await ServicesClass.getTodoData(AppUrl.todo);
    if (finalResponse is Success){
      setTodoModel(finalResponse.response as List<TodoModel>);
    }

    if(finalResponse is Failure){
      print(finalResponse.code);
    }
  }

}