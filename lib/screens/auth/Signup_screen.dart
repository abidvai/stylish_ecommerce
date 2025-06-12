import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_app/screens/auth/login_screen.dart';
import 'package:stylish_app/services/auth_service.dart';

import '../../constant/color.dart';
import '../../constant/image.dart';
import '../../constant/text.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_logo_container.dart';
import '../../widget/custom_textInput.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<void> signup() async {
    if (_formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final confirmPassword = confirmPasswordController.text.trim();

      if (password != confirmPassword) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Passwords do not match')));
        return;
      }
      setState(() {
        isLoading = true;
      });

      try {
        final user = await AuthService.signup(email, password);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text('Signup Successful'),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signup failed: ${e.toString()}')),
        );
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 19, right: 29, top: 9),
            child: Form(
              key: _formKey,
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
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
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
          validator: (value) {
            final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
            if (!emailRegex.hasMatch(value!)) {
              return 'Enter a valid email';
            }
            if (value.isEmpty) {
              return 'Email is required';
            }
            return null;
          },
          controller: emailController,
          prefix: Icons.person,
          hintText: 'Username or Email',
        ),
        SizedBox(height: 31),
        CustomTextInput(
          validator: (value) {
            if (value!.length < 6) {
              return 'password must be at least 6 letters';
            }
            if (value.isEmpty) {
              return 'Password is required';
            }
            return null;
          },
          controller: passwordController,
          prefix: Icons.lock,
          suffix: Icons.remove_red_eye_outlined,
          hintText: 'Password',
        ),
        SizedBox(height: 31),
        CustomTextInput(
          controller: confirmPasswordController,
          prefix: Icons.lock,
          suffix: Icons.remove_red_eye_outlined,
          hintText: 'ConfirmPassword',
        ),
        SizedBox(height: 19),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'By clicking the',
                style: TextStyle(color: Colors.black),
              ),
              WidgetSpan(child: SizedBox(width: 5)),
              TextSpan(
                text: 'Register',
                style: TextStyle(color: Colors.redAccent),
                recognizer:
                    TapGestureRecognizer()
                      ..onTap = () {
                        //TODO: tap functionality
                        // Handle your tap here
                        print('Register tapped!');
                        // Or navigate, show dialog, etc.
                      },
              ),
              WidgetSpan(child: SizedBox(width: 5)),
              TextSpan(
                text: 'button, you agree to the public offer',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        SizedBox(height: 38),
        isLoading
            ? Center(child: CircularProgressIndicator())
            : CustomButton(
              buttonText: 'Create Account',
              onTap: () {
                signup();
              },
            ),
      ],
    );
  }
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
          Text(
            'I Already Have an Account',
            style: TextStyle(
              fontSize: 14,
              fontFamily:
                  GoogleFonts.poppins(fontWeight: FontWeight.normal).fontFamily,
            ),
          ),
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
