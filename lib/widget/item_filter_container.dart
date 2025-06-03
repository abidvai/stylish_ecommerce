import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/image.dart';
import '../screens/home_screen/widget/chip_widget.dart';

class ItemFilterContainer extends StatelessWidget {
  final String title;
  final VoidCallback? onTapSort;
  final VoidCallback? onTapFilter;

  const ItemFilterContainer({
    super.key, required this.title, this.onTapSort, this.onTapFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 17, horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontFamily:
              GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
              ).fontFamily,
            ),
          ),
          Row(
            children: [
              ChipWidget(
                  titleText: 'Sort',
                  icon: AppImage.upDown,
                  onTap: onTapSort
              ),
              SizedBox(width: 14),
              ChipWidget(titleText: 'Filter', icon: AppImage.filter, onTap: onTapFilter,),
            ],
          ),
        ],
      ),
    );
  }
}
