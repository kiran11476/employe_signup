import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'employe_contoler.dart';

class EmployeeCreatePage extends StatelessWidget {
  final EmployeeController employeeController = Get.find<EmployeeController>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  EmployeeCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Employee')),
      body: Padding(
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
                final employee = Employee(
                  id: '0', // ID is not used for creation, so dummy value
                  name: nameController.text,
                  salary: salaryController.text,
                  age: ageController.text,
                );
                employeeController.createEmployee(employee);
                Get.back();
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
