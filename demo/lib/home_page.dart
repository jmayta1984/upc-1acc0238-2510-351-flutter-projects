import 'package:demo/color_palette.dart';
import 'package:demo/custom_text_field.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomTextField(icon: Icon(Icons.search), hintText: "Search"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [Colors.black, ColorPalette.primary],
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Get Your Special Sale",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Up to 50%",
                          style: TextStyle(color: ColorPalette.primary),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlinedButton(
                              
                              style: OutlinedButton.styleFrom(
                                backgroundColor: ColorPalette.primary,
                                foregroundColor: Colors.white,
                                side: BorderSide(color: ColorPalette.primary),
                              ),
                              onPressed: () => {},
                              child: Text("Shop Now"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  Expanded(child: Image.asset("assets/adidas.png")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
