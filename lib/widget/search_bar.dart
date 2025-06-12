import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildSearchBar() {
  return Padding(
    padding: EdgeInsets.only(left: 16, right: 16, top: 16),
    child: Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(10),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12),
          hintText: 'Search any product..',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontFamily: GoogleFonts.montserrat().fontFamily,
          ),
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          suffixIcon: Icon(Icons.mic_none, color: Colors.grey),
          border: InputBorder.none,
          fillColor: Colors.transparent,
          filled: true,
        ),
      ),
    ),
  );
}