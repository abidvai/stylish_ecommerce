import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_app/screens/auth/login_screen.dart';

import '../../constant/color.dart';
import '../../constant/image.dart';
import '../../constant/text.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_logo_container.dart';
import '../../widget/custom_textInput.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 19, right: 29, top: 9),
            child: Column(
              children: [
                _buildTopSection(context),
                SizedBox(height: 40),
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
  final TextEditingController confirmPassword = TextEditingController();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        AppText.createAccount,
        style: TextStyle(
          fontSize: 36,
          fontFamily:
              GoogleFonts.montserrat(fontWeight: FontWeight.bold).fontFamily,
        ),
      ),
      SizedBox(height: 33),
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
      SizedBox(height: 31),
      CustomTextInput(
        controller: confirmPassword,
        prefix: Icons.lock,
        suffix: Icons.remove_red_eye_outlined,
        hintText: 'ConfirmPassword',
      ),
      SizedBox(height: 19),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(text: 'By clicking the', style: TextStyle(color: Colors.black)),
            WidgetSpan(child: SizedBox(width: 5,)),
            TextSpan(
              text: 'Register',
              style: TextStyle(
                color: Colors.redAccent,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                //TODO: tap functionality
                  // Handle your tap here
                  print('Register tapped!');
                  // Or navigate, show dialog, etc.
                },
            ),
            WidgetSpan(child: SizedBox(width: 5,)),
            TextSpan(text: 'button, you agree to the public offer', style: TextStyle(color: Colors.black))
          ],
        ),
      ),
      SizedBox(height: 38),
      CustomButton(buttonText: 'Create Account', onTap: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
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
          Text('I Already Have an Account', style: TextStyle(
            fontSize: 14,
            fontFamily: GoogleFonts.poppins(
              fontWeight: FontWeight.normal
            ).fontFamily
          ),),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text(
              AppText.login,
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
