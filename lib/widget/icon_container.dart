import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/color.dart';

class IconContainer extends StatelessWidget {
  final String imagePath;

  const IconContainer({
    super.key, required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black.withOpacity(0.1),
      ),
      child: SvgPicture.asset(imagePath, width: 20, height: 20, color: Colors.black,),
    );
  }
}
