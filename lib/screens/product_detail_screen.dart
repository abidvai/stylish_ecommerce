import 'package:flutter/material.dart';
import 'package:stylish_app/constant/color.dart';
import 'package:stylish_app/constant/image.dart';
import 'package:stylish_app/widget/icon_container.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            leading: Padding(padding: EdgeInsets.only(left: 22),
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios))),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconContainer(imagePath: AppImage.cart),
              )
            ],
          )
        ],
      ),
    );
  }
}
