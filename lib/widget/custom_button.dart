import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/color.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onTap;

  const CustomButton({
    super.key,
    required this.buttonText, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.sizeOf(context).width * .9,
        height: MediaQuery.sizeOf(context).height * .07,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontFamily: GoogleFonts.montserrat().fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}