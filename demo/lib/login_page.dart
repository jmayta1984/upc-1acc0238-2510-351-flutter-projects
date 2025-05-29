import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                cursorColor: Colors.deepOrange,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Email",

                  filled: true,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                cursorColor: Colors.deepOrange,
                decoration: InputDecoration(
                  filled: true,
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
