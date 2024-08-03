import 'package:employ_details/auth.dart';
import 'package:employ_details/employe_contoler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EmployeeListPage extends StatelessWidget {
  final EmployeeController employeeController = Get.find<EmployeeController>();

  const EmployeeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Get.find<AuthController>().signOut();
              Get.offNamed('/login');
            },
          )
        ],
      ),
      body: Obx(() {
        if (employeeController.employees.isEmpty) {
          return const Center(child: Text('No employees found.'));
        }
        return ListView.builder(
          itemCount: employeeController.employees.length,
          itemBuilder: (context, index) {
            final employee = employeeController.employees[index];
            return ListTile(
              title: Text(employee.name),
              subtitle: Text('Salary: ${employee.salary}, Age: ${employee.age}'),
              onTap: () {
                Get.toNamed('/employee/${employee.id}');
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
