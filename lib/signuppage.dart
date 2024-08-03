import 'package:employ_details/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpPage extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authController.signUp(emailController.text, passwordController.text);
              },
              child: const Text('Sign Up'),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
