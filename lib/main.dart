import 'package:employ_details/auth.dart';
import 'package:employ_details/auth_screen.dart';
import 'package:employ_details/employment_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginPage(),
        ),
        GetPage(name: '/employees', page: () => const EmployeeListPage()),
      ],
      title: 'Employee Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
