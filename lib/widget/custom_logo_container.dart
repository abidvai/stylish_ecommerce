import 'package:flutter/material.dart';

import '../constant/color.dart';

class LogoContainer extends StatelessWidget {
  final String logo;

  const LogoContainer({super.key, required this.logo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.2),
          shape: BoxShape.circle,
          border: Border.all(
              width: 1,
              color: AppColors.primaryColor
          )
      ),
      child: Image.asset(logo, width: 24, height: 24,),
    );
  }
}
