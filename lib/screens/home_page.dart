import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final AuthService authService = AuthService();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {

              await authService.logoutUser();

              Navigator.pushReplacementNamed(context, "/login");

            },
          )
        ],
      ),
      body: const Center(
        child: Text("Welcome to Verde App"),
      ),
    );
  }
}