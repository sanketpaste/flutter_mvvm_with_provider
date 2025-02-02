import 'package:flutter/material.dart';
import 'package:flutter_module_3/view_models/todo_vm.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    TodoViewModel todo =Provider.of<TodoViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MVVM Practice'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: (){
              todo.getTodoResponse();
            }, 
          child: Text('Get Todos')),

          Expanded(
            child: ListView.builder(
              itemCount: todo.todoModel.length,
              itemBuilder: (BuildContext context ,int index){
                return Column(
                  children: [
                    for( var todoItem in todo.todoModel[index].todos?? [])
                    Text("Todo: ${todoItem.todo}"),
                  ],
                );
              }
              ),
          )
         
        ],
      ),
    );
  }
}