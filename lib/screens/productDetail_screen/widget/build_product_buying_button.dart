import 'package:flutter/material.dart';

Widget buildProductBuyingButton(
    String buttonText,
    IconData icon,
    Gradient color,
    ) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          gradient: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(width: 12),
      Positioned(
        left: -34,
        bottom: -2,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: color,
            shape: BoxShape.circle,
            border: Border.all(width: 3, color: Colors.black.withOpacity(0.2)),
          ),
          child: Icon(icon, size: 24, color: Colors.white),
        ),
      ),
    ],
  );
}