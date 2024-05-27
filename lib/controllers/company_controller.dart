import 'dart:convert';

import 'package:lesson44/models/company.dart';
import 'package:lesson44/models/employee.dart';

class CompanyContoller {
  final List<Company> _list = [];

  List<Company> get list {
    return [..._list];
  }

  void getProducts() {
    const String url = '''
      {
        "company": "Tech Solutions",
        "location": "San Francisco",
        "employees": [
          {
            "name": "Alice",
            "age": 30,
            "position": "Developer",
            "skills": ["Dart", "Flutter", "Firebase"]
          },
          {
            "name": "Bob",
            "age": 25,
            "position": "Designer",
            "skills": ["Photoshop", "Illustrator"]
          }
        ],
        "products": [
          {"name": "Product A", "price": 29.99, "inStock": true},
          {"name": "Product B", "price": 49.99, "inStock": false}
        ]
      }
     ''';
    Map<String, dynamic> data = jsonDecode(url);

    _list.add(Company.fromJson(data));
    // print(_list[0].products);
  }

  void deleteEmployee(int index) {
      _list[0].employees.removeAt(index);
  }

  void addEmployee(Employee employee) {
    _list[0].employees.add(employee);
  }

  void editEmployee(int index, String name, int age, String position) {
    var employee = _list[0].employees[index];
    employee.name = name;
    employee.age = age;
    employee.position = position;
  }
}
