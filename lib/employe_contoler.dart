import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmployeeController extends GetxController {
  var employees = <Employee>[].obs;
  final baseUrl = 'https://dummy.restapiexample.com/api/v1';

  Future<void> fetchEmployees() async {
    final response = await http.get(Uri.parse('$baseUrl/employee'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      employees.value = (data['data'] as List).map((item) => Employee.fromJson(item)).toList();
    }
  }

  Future<void> createEmployee(Employee employee) async {
    final response = await http.post(
      Uri.parse('$baseUrl/create'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(employee.toJson()),
    );
    if (response.statusCode == 200) {
      fetchEmployees();
    }
  }

  Future<void> updateEmployee(Employee employee) async {
    final response = await http.put(
      Uri.parse('$baseUrl/update/${employee.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(employee.toJson()),
    );
    if (response.statusCode == 200) {
      fetchEmployees();
    }
  }

  Future<void> deleteEmployee(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/delete/$id'));
    if (response.statusCode == 200) {
      fetchEmployees();
    }
  }
}

class Employee {
  final String id;
  final String name;
  final String salary;
  final String age;

  Employee({
    required this.id,
    required this.name,
    required this.salary,
    required this.age,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['employee_name'],
      salary: json['employee_salary'],
      age: json['employee_age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'employee_name': name,
      'employee_salary': salary,
      'employee_age': age,
    };
  }
}
