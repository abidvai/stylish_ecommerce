import 'package:flutter/material.dart';
import 'package:stylish_app/screens/auth/login_screen.dart';
import 'package:stylish_app/services/auth_service.dart';
import 'package:stylish_app/widget/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService.userEmail;
    final name = AuthService.userEmail;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('This is CHeif $user profile Section'),
          Text('This is CHeif $name profile Section'),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(AuthService.userImage ?? ''),
            backgroundColor: Colors.grey[200],
          ),
          SizedBox(height: 20),
          CustomButton(
            buttonText: 'Logout',
            onTap: () async {
              await AuthService.signOut();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.orangeAccent,
                  content: Text('User logout'),
                ),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
