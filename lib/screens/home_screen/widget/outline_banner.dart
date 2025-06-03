import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/color.dart';
import 'outline_button_widget.dart';

class OutlineBanner extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;
  final VoidCallback? onTap;

  const OutlineBanner({
    super.key, required this.title, required this.icon, required this.description, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 12, top: 8, bottom: 8),
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.lightBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.white,
                  fontFamily:
                  GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                  ).fontFamily,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(icon, color: AppColors.white,),
                  SizedBox(width: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.white,
                      fontFamily:
                      GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400
                      ).fontFamily,
                    ),
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: onTap,
            child: OutlineButtonWidget(
              buttonText: 'View all',
              icon: Icons.arrow_forward_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
