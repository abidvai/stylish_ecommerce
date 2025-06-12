import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish_app/screens/profile_screen.dart';

import '../constant/color.dart';
import '../constant/image.dart';
import '../services/auth_service.dart';

Widget appBar(BuildContext context) {
  final userImage = AuthService.userImage;

  return SliverAppBar(
    backgroundColor: Colors.transparent,
    title: SvgPicture.asset(AppImage.appLogo),
    centerTitle: true,
    leading: GestureDetector(
      onTap: (){
        /// TODO: Drawer
      },
      child: Container(
        margin: EdgeInsets.only(left: 16),
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.grey.withOpacity(0.4),
        ),
        child: SvgPicture.asset(AppImage.threeDot, width: 20, height: 20),
      ),
    ),
    actions: [
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
        },
        child: Padding(
          padding: EdgeInsets.only(right: 12),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: Colors.green,
            child: ClipOval(
              child: Image.network(
                userImage!,
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
