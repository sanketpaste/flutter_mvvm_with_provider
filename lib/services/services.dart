import 'package:flutter_module_3/helper/app_url.dart';
import 'package:flutter_module_3/helper/network_helper.dart';
import 'package:flutter_module_3/models/todo_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServicesClass {
  static Future<Object> getTodoData(String apiName) async {
    try {
      var url = Uri.parse(AppUrl.domain+apiName);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var decodedResponce = jsonDecode(response.body);

        if (decodedResponce is List) {
          List<TodoModel> todoList =decodedResponce.map((item)=>TodoModel.fromJson(item)).toList();
          return Success(code: 200, response: todoList);
        } else if (decodedResponce is Map<String, dynamic>) {
          TodoModel todoModel = TodoModel.fromJson(decodedResponce);
          return Success(code: 200, response:[todoModel]);
        } else {
          return Failure(
              code: response.statusCode,
              response: "Invalid Response Structure");
        }
      } else {
        return Failure(
            code: response.statusCode, response: "Invalid Response Coming");
      }
    } catch (e) {
      return "Invalid Response";
    }
  }
}
