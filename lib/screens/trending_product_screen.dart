import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_app/widget/item_filter_container.dart';
import 'package:stylish_app/widget/product_card.dart';

import '../constant/color.dart';
import '../constant/image.dart';
import '../constant/text.dart';
import 'home_screen/model/product_model.dart';
import 'home_screen/widget/chip_widget.dart';

class TrendingProductScreen extends StatelessWidget {
  TrendingProductScreen({super.key});

  final List<ProductModel> productList = [
    ProductModel(
      imagePath:
          'https://images.pexels.com/photos/1537671/pexels-photo-1537671.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      title: 'Women Printed Kurta',
      description: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: '₹1500',
      depricatedPrice: '₹2499',
      offerText: '40%Off',
      ratingCount: '56890',
    ),
    ProductModel(
      imagePath:
          'https://images.pexels.com/photos/20791989/pexels-photo-20791989/free-photo-of-woman-standing-in-white-traditional-clothing-and-shawl-in-front-of-doorway.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      title: 'Women Printed Kurta',
      description: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: '₹1500',
      depricatedPrice: '₹2499',
      offerText: '40%Off',
      ratingCount: '56890',
    ),
    ProductModel(
      imagePath:
          'https://images.pexels.com/photos/2759783/pexels-photo-2759783.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      title: 'Women Printed Kurta',
      description: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: '₹1500',
      depricatedPrice: '₹2499',
      offerText: '40%Off',
      ratingCount: '56890',
    ),
    ProductModel(
      imagePath:
      'https://images.pexels.com/photos/2759783/pexels-photo-2759783.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      title: 'Women Printed Kurta',
      description: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: '₹1500',
      depricatedPrice: '₹2499',
      offerText: '40%Off',
      ratingCount: '56890',
    ),
    ProductModel(
      imagePath:
      'https://images.pexels.com/photos/20791989/pexels-photo-20791989/free-photo-of-woman-standing-in-white-traditional-clothing-and-shawl-in-front-of-doorway.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      title: 'Women Printed Kurta',
      description: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: '₹1500',
      depricatedPrice: '₹2499',
      offerText: '40%Off',
      ratingCount: '56890',
    ),
    ProductModel(
      imagePath:
      'https://images.pexels.com/photos/1537671/pexels-photo-1537671.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      title: 'Women Printed Kurta',
      description: 'Neque porro quisquam est qui dolorem ipsum quia',
      price: '₹1500',
      depricatedPrice: '₹2499',
      offerText: '40%Off',
      ratingCount: '56890',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
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
                color: AppColors.grey.withOpacity(0.4),
              ),
              child: SvgPicture.asset(AppImage.threeDot, width: 20, height: 20),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.green,
                  child: ClipOval(
                    child: Image.asset(
                      AppImage.boy,
                      fit: BoxFit.cover,
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
              ),
            ],
          ),

          /// search bar
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
                      fontFamily: GoogleFonts.montserrat().fontFamily,
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

          /// category text
          SliverToBoxAdapter(
            child: ItemFilterContainer(title: '52,082+ Iteams')
          ),

          SliverPadding(
            padding: EdgeInsets.only(top: 16, right: 16, bottom: 30),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final product = productList[index];
                return ProductCard(
                  product: product,
                  ratingActive: true,
                  carWidth: MediaQuery.sizeOf(context).width * .42,
                );
              }, childCount: productList.length),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 5,
                childAspectRatio: 0.62,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
