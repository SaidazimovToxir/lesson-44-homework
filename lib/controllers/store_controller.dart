import 'dart:convert';

import 'package:lesson44/models/category_model.dart';
import 'package:http/http.dart' as http;

class StoreController {
  final List<CategoryModel> _list = [];

  List<CategoryModel> get list {
    return [..._list];
  }

  Future<void> getStoreInfo() async {
    Uri url = Uri.parse("https://fakestoreapi.com/products");
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception("Not found");
      } else {
        List<dynamic> jsonData = jsonDecode(response.body);
        List<Map<String, dynamic>> data =
            jsonData.map((item) => item as Map<String, dynamic>).toList();
        for (var i in data) {
          _list.add(CategoryModel.fromJson(i));
        }
        // print(_list);
        
      }
    } catch (e) {
      print(e);
    }
  }
}

// void main(List<String> args) {
//   StoreController storeController = StoreController();
//   storeController.getStoreInfo();
// }
