import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_app/constant/color.dart';
import 'package:stylish_app/constant/image.dart';
import 'package:stylish_app/constant/text.dart';
import 'package:stylish_app/screens/auth/Signup_screen.dart';
import 'package:stylish_app/screens/auth/forgot_screen.dart';
import 'package:stylish_app/screens/getstarted_screen.dart';
import 'package:stylish_app/widget/custom_logo_container.dart';
import 'package:stylish_app/widget/custom_textInput.dart';

import '../../widget/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(left: 19, right: 29, top: 9),
            child: Column(
              children: [
                _buildTopSection(context),
                SizedBox(height: 75),
                _buildBottomSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTopSection(BuildContext context) {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(AppText.welcomeBack, style: TextStyle(
        fontSize: 36,
        fontFamily: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold
        ).fontFamily
      ),),
      SizedBox(height: 36),
      CustomTextInput(
        controller: email,
        prefix: Icons.person,
        hintText: 'Username or Email',
      ),
      SizedBox(height: 31),
      CustomTextInput(
        controller: password,
        prefix: Icons.lock,
        suffix: Icons.remove_red_eye_outlined,
        hintText: 'Password',
      ),
      SizedBox(height: 9),
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotScreen()));
        },
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            AppText.forgetPassword,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.primaryColor,
              fontFamily: GoogleFonts.montserrat().fontFamily,
            ),
          ),
        ),
      ),
      SizedBox(height: 52),
      CustomButton(buttonText: 'Login', onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GetStartedScreen()));
      },),
    ],
  );
}

Widget _buildBottomSection(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    children: [
      Text('- OR Continue with -'),
      SizedBox(height: 20),
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LogoContainer(logo: AppImage.googleLogo),
          SizedBox(width: 10),
          LogoContainer(logo: AppImage.appleLogo),
          SizedBox(width: 10),
          LogoContainer(logo: AppImage.facebookLogo),
        ],
      ),
      SizedBox(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Create An Account?'),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
            },
            child: Text(
              AppText.signup,
              style: TextStyle(
                color: AppColors.secondaryColor,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.secondaryColor,
                decorationThickness: 2,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
