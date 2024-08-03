import 'dart:convert';

import 'package:employ_details/employe_contoler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EmployeeUpdatePage extends StatelessWidget {
  final String id;
  EmployeeUpdatePage(this.id, {super.key});

  final EmployeeController employeeController = Get.find<EmployeeController>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Employee')),
      body: FutureBuilder<Employee>(
        future: fetchEmployeeDetail(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data found.'));
          }

          final employee = snapshot.data!;
          nameController.text = employee.name;
          salaryController.text = employee.salary;
          ageController.text = employee.age;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: salaryController,
                  decoration: const InputDecoration(labelText: 'Salary'),
                ),
                TextField(
                  controller: ageController,
                  decoration: const InputDecoration(labelText: 'Age'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final updatedEmployee = Employee(
                      id: id,
                      name: nameController.text,
                      salary: salaryController.text,
                      age: ageController.text,
                    );
                    employeeController.updateEmployee(updatedEmployee);
                    Get.back();
                  },
                  child: const Text('Update'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<Employee> fetchEmployeeDetail() async {
    final response = await http.get(Uri.parse('https://dummy.restapiexample.com/api/v1/employee/$id'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Employee.fromJson(data['data']);
    } else {
      throw Exception('Failed to load employee details');
    }
  }
}
