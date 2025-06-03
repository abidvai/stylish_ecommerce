import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_app/constant/color.dart';
import 'package:stylish_app/constant/image.dart';
import 'package:stylish_app/widget/custom_button.dart';

import 'home_screen/screen/home_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(AppImage.getStarted, fit: BoxFit.cover, height: double.infinity,),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.3),
          ),
          Positioned(
            bottom: 169,
            left: 37,
            right: 37,
            child: Text(
              'You want\nAuthentic, here you go!',
              style: TextStyle(
                color: AppColors.white,
                  fontSize: 34,
                  fontFamily: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600
                  ).fontFamily,
                  overflow: TextOverflow.ellipsis),
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
          ),
          Positioned(
            bottom: 133,
            left: 37,
            right: 37,
            child: Text(
              'Find it here, buy it now!',
              style: TextStyle(
                color: AppColors.white,
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                  overflow: TextOverflow.ellipsis),
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
          ),
          Positioned(
            bottom: 34,
            left: 55,
            right: 56,
            child: CustomButton(buttonText: 'Get Started', onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
            },)
          ),
        ],
      ),
    );
  }
}
