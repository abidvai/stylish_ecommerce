

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/color.dart';
import '../../../constant/image.dart';
import 'outline_button_widget.dart';

Widget summerOfferContainer() {
  return Container(
    margin: EdgeInsets.only(left: 16, right: 16),
    padding: EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Material(
      clipBehavior: Clip.none,
      borderRadius: BorderRadius.circular(10),
      elevation: 1,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                AppImage.summerOffer,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.only(left: 8, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Arrivals',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily:
                          GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                          ).fontFamily,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Summer’ 25 Collections',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily:
                          GoogleFonts.montserrat(
                            fontWeight: FontWeight.normal,
                          ).fontFamily,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 26),
                    child: OutlineButtonWidget(
                      buttonText: 'View all',
                      icon: Icons.arrow_forward_outlined,
                      bgColor: AppColors.secondaryColor,
                      borderColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}