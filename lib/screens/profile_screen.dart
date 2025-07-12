import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:stylish_app/screens/auth/login_screen.dart';
import 'package:stylish_app/services/auth_service.dart';
import 'package:stylish_app/widget/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = AuthService.userEmail;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Welcome $user'),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => Scaffold(
                          appBar: AppBar(),
                          body: PhotoViewGallery.builder(
                            itemCount: 1,
                            builder: (context, index) {
                              return PhotoViewGalleryPageOptions(
                                  imageProvider: NetworkImage(AuthService.userImage ?? 'https://images.pexels.com/photos/32412580/pexels-photo-32412580/free-photo-of-woman-in-black-with-white-umbrella-by-tree.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                              minScale: PhotoViewComputedScale.contained,
                              maxScale: PhotoViewComputedScale.covered);
                            },
                            scrollPhysics: BouncingScrollPhysics(),
                            backgroundDecoration: BoxDecoration(
                              color: Colors.black
                            ),
                          )
                        ),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AuthService.userImage != null ? NetworkImage(AuthService.userImage!) : NetworkImage('https://images.pexels.com/photos/32412580/pexels-photo-32412580/free-photo-of-woman-in-black-with-white-umbrella-by-tree.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                backgroundColor: Colors.grey[200],
              ),
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
                if(context.mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                }
              },
            ),
            SizedBox(height: 30,),
            CustomButton(buttonText: 'Delete Account', onTap: () async{
              await AuthService.deleteAccount();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('User deleted'),
                ),
              );
            },),
            SizedBox(height: 30,),
            CustomButton(buttonText: 'send Email Verification', onTap: () async{
              await AuthService.sendEmailVerification();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('User deleted'),
                ),
              );
            },),
            SizedBox(height: 30,),
            CustomButton(buttonText: 'reset password', onTap: () async{
              await AuthService.resetPassword(user!);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text('Check your email for reset password'),
                ),
              );
            },)
          ],
        ),
      ),
    );
  }
}
