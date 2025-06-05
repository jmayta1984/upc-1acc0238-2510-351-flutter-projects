import 'package:demo/core/themes/color_palette.dart';
import 'package:flutter/material.dart';

class BannerView extends StatelessWidget {
  const BannerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: ColorPalette.primary
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
    );
  }
}
