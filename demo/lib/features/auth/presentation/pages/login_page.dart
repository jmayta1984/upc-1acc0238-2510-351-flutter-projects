import 'package:demo/core/themes/color_palette.dart';
import 'package:demo/core/ui/custom_text_field.dart';
import 'package:demo/features/app/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(icon: Icon(Icons.search), hintText: "Search"),
              SizedBox(height: 8),
              CustomTextField(icon: Icon(Icons.lock), hintText: "Password"),
              SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: ColorPalette.primary,
                    foregroundColor: Colors.white,
                    side: BorderSide(color: ColorPalette.primary),
                  ),
                  onPressed: () => {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    ),
                  },
                  child: Text("Sign in"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
