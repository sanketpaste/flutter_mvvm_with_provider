import 'package:flutter/material.dart';
import 'package:flutter_module_3/view/home.dart';
import 'package:flutter_module_3/view_models/todo_vm.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=> TodoViewModel())
    ],
    child: MaterialApp(
     home: HomeScreen(),
    ),
  ));
}