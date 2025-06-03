import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ChipWidget extends StatelessWidget {
  final String titleText;
  final String icon;
  final VoidCallback? onTap;

  const ChipWidget({
    super.key,
    required this.titleText,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(titleText),
              SizedBox(width: 4),
              SvgPicture.asset(icon),
            ],
          ),
        ),
      ),
    );
  }
}
