import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildProductDetailsChip(String title, IconData icon) {
  return Container(
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(4),
      border: Border.all(color: Colors.black.withOpacity(0.4), width: 1.2),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.grey),
        Text(
          title,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey,
            fontFamily:
            GoogleFonts.montserrat(fontWeight: FontWeight.w600).fontFamily,
          ),
        ),
      ],
    ),
  );
}
