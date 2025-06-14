import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_app/constant/color.dart';
import 'package:stylish_app/constant/image.dart';
import 'package:stylish_app/constant/text.dart';
import 'package:stylish_app/screens/auth/Signup_screen.dart';
import 'package:stylish_app/screens/auth/forgot_screen.dart';
import 'package:stylish_app/screens/getstarted_screen.dart';
import 'package:stylish_app/screens/home_screen/screen/home_screen.dart';
import 'package:stylish_app/widget/custom_logo_container.dart';
import 'package:stylish_app/widget/custom_textInput.dart';

import '../../services/auth_service.dart';
import '../../widget/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      setState(() {
        isLoading = true;
      });

      try {
        final user = await AuthService.login(email, password);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => GetStartedScreen()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text('Login Successful'),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login failed: ${e.toString()}')),
        );
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(left: 19, right: 29, top: 9),
            child: Form(
              key: _formKey,
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
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppText.welcomeBack,
          style: TextStyle(
            fontSize: 36,
            fontFamily:
                GoogleFonts.montserrat(fontWeight: FontWeight.bold).fontFamily,
          ),
        ),
        SizedBox(height: 36),
        CustomTextInput(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Email is not registered yet';
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
            if (value!.isEmpty) {
              return 'Password is invalid';
            }
            return null;
          },
          controller: passwordController,
          prefix: Icons.lock,
          suffix: Icons.remove_red_eye_outlined,
          hintText: 'Password',
        ),
        SizedBox(height: 9),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForgotScreen()),
            );
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
        isLoading
            ? Center(child: CircularProgressIndicator())
            : CustomButton(
              buttonText: 'Login',
              onTap: () {
                login();
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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LogoContainer(
            logo: AppImage.googleLogo,
            onTap: () async {
              final user = await AuthService.googleWithSignIn();
              if (user != null) {
                print('Signed in as ${user.email}');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              } else {
                print('Google sign-in cancelled');
              }
            },
          ),
          SizedBox(width: 10),
          LogoContainer(
            logo: AppImage.appleLogo,
            onTap: () async {
              final user = await AuthService.signInWithApple();
              if (user != null) {
                print('Signed in as ${user.email}');
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              } else {
                print('Google sign-in cancelled');
              }
            },
          ),
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupScreen()),
              );
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
