import 'dart:convert';

import 'package:employ_details/employe_contoler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EmployeeDetailPage extends StatelessWidget {
  final String id;
  EmployeeDetailPage(this.id, {super.key});

  final EmployeeController employeeController = Get.find<EmployeeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Details')),
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
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${employee.name}', style: const TextStyle(fontSize: 20)),
                Text('Salary: ${employee.salary}', style: const TextStyle(fontSize: 20)),
                Text('Age: ${employee.age}', style: const TextStyle(fontSize: 20)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/update/${employee.id}');
                      },
                      child: const Text('Update'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        employeeController.deleteEmployee(employee.id);
                        Get.back();
                      },
                      child: const Text('Delete'),
                    ),
                  ],
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
