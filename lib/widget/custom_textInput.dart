import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/color.dart';


class CustomTextInput extends StatelessWidget {
  final TextEditingController controller;
  final IconData prefix;
  final IconData? suffix;
  final String hintText;

  const CustomTextInput({super.key, required this.controller, required this.prefix, this.suffix, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 12,
              fontFamily: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500
              ).fontFamily
          ),
          prefixIcon: Padding(padding: EdgeInsets.only(left: 11),
              child: Icon(prefix,size: 24,)),
          suffixIcon: Icon(suffix, size: 24,),
          filled: true,
          fillColor: AppColors.greyLight,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Colors.black
              )
          )
      ),
    );
  }
}
