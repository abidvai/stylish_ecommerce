import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/color.dart';
import '../../../widget/outline_button.dart';

class CustomBannerContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String buttonText;
  final String imagePath;
  final IconData icon;

  const CustomBannerContainer({
    super.key, required this.title, required this.subtitle, required this.description, required this.buttonText, required this.icon, required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.sizeOf(context).width * .8,
      height: MediaQuery.sizeOf(context).height * .21,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [AppColors.primaryColor.withOpacity(0.8), AppColors.secondaryColor.withOpacity(0.4)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 14, top: 20, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      height: 1,
                      color: AppColors.white,
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.white,
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.white,
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                    ),
                  ),
                  SizedBox(height: 2),
                  SizedBox(
                    height: 20,
                    child: OutlineButtonWidget(
                      buttonText: buttonText,
                      icon: icon,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
