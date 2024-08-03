// import 'package:flutter/material.dart';

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('Employee List'),
//     ),
//     body: LayoutBuilder(
//       builder: (context, constraints) {
//         if (constraints.maxWidth < 600) {
//           return ListView(
//             children: _buildEmployeeList(),
//           );
//         } else {
//           return GridView.builder(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//               childAspectRatio: 4,
//             ),
//             itemCount: employeeController.employees.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 child: ListTile(
//                   title: Text(employeeController.employees[index].name),
//                 ),
//               );
//             },
//           );
//         }
//       },
//     ),
//     floatingActionButton: FloatingActionButton(
//       onPressed: () {
//         Get.toNamed('/create');
//       },
//       child: Icon(Icons.add),
//     ),
//   );
// }
