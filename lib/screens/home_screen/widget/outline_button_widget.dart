import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/color.dart';

class OutlineButtonWidget extends StatelessWidget {
  final String buttonText;
  final IconData icon;
  final Color? bgColor;
  final Color? borderColor;
  final VoidCallback? onTap;

  const OutlineButtonWidget({
    super.key,
    required this.buttonText,
    required this.icon,
    this.bgColor,
    this.borderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          color: bgColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: borderColor ?? AppColors.white,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              buttonText,
              style: TextStyle(
                fontSize: 10,
                color: AppColors.white,
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
            ),
            SizedBox(width: 4),
            Icon(
              icon,
              size: 12,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}