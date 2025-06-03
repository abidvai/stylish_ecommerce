import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_app/constant/color.dart';
import 'package:stylish_app/constant/text.dart';
import 'package:stylish_app/widget/custom_button.dart';
import 'package:stylish_app/widget/custom_textInput.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 19, right: 29, top: 9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppText.forgotPassword2,
                style: TextStyle(
                  fontSize: 36,
                  fontFamily:
                      GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                      ).fontFamily,
                ),
              ),
              SizedBox(height: 32),
              CustomTextInput(
                controller: email,
                prefix: Icons.email,
                hintText: 'Enter your email address',
              ),
              SizedBox(height: 26),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                    WidgetSpan(child: SizedBox(width: 5)),
                    TextSpan(
                      text: AppText.sendingMessage,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontFamily: GoogleFonts.montserrat().fontFamily,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 26),
              CustomButton(
                buttonText: AppText.submit,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Submitting your request'),
                      backgroundColor: Colors.green,
                      duration: Duration(milliseconds: 1600),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
