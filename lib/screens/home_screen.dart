import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_app/constant/color.dart';
import 'package:stylish_app/constant/image.dart';
import 'package:stylish_app/constant/text.dart';
import 'package:stylish_app/screens/home_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<HomeModel> category = [
    HomeModel(title: 'Beauty', imagePath: AppImage.beauty),
    HomeModel(title: 'Fashion', imagePath: AppImage.fashion),
    HomeModel(title: 'Kids', imagePath: AppImage.kids),
    HomeModel(title: 'Mens', imagePath: AppImage.mens),
    HomeModel(title: 'Womens', imagePath: AppImage.womens),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            title: SvgPicture.asset(AppImage.appLogo),
            centerTitle: true,
            leading: Container(
              margin: EdgeInsets.only(left: 16),
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.grey.withOpacity(0.4)
              ),
              child: SvgPicture.asset(AppImage.threeDot, width: 20, height: 20,),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.green,
                  child: ClipOval(
                      child: Image.asset(AppImage.boy, fit: BoxFit.cover, width: 40, height: 40,)),
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Material(
                elevation: 1,
                borderRadius: BorderRadius.circular(10),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                    hintText: 'Search any product..',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontFamily: GoogleFonts.montserrat().fontFamily
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    suffixIcon: Icon(Icons.mic_none, color: Colors.grey),
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    filled: true,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 17, horizontal: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppText.allFeatured, style: TextStyle(
                    fontSize: 18,
                    fontFamily: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500
                    ).fontFamily
                  ),),
                  Row(
                    children: [
                      ChipWidget(titleText: 'Sort', icon: AppImage.upDown, onTap: (){
                        //TODO: ontap funtionality
                      },),
                      SizedBox(width: 14,),
                      ChipWidget(titleText: 'Filter', icon: AppImage.filter,),
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(left: 16),
              height: MediaQuery.sizeOf(context).height * .1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.redAccent
              ),
              child: ListView.separated(
                padding: EdgeInsets.only(left: 8, top: 14),
                scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                separatorBuilder: (context, index) {
                    return SizedBox(width: 16,);
                },
                itemBuilder: (context, index) {
                    final productCategory = category[index];
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        children: [
                          Image.asset(productCategory.imagePath),
                          Text(productCategory.title)
                        ],
                      ),
                    );
                },
              )
            ),
          )
        ],
      ),
    );
  }
}

class ChipWidget extends StatelessWidget {
  final String titleText;
  final String icon;
  final VoidCallback? onTap;

  const ChipWidget({
    super.key, required this.titleText, required this.icon, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            children: [
              Text(titleText),
              SizedBox(width: 4,),
              SvgPicture.asset(icon)
            ],
          ),
        ),
      ),
    );
  }
}
