import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/color.dart';

Widget buildSizeChip(String size) {
  return Container(
    padding: EdgeInsets.all(6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.transparent,
      border: Border.all(color: AppColors.secondaryColor, width: 1.3),
    ),
    child: Text(
      size,
      style: TextStyle(
        fontSize: 14,
        color: AppColors.secondaryColor,
        fontFamily:
        GoogleFonts.montserrat(fontWeight: FontWeight.bold).fontFamily,
      ),
    ),
  );
}
