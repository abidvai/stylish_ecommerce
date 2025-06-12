import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylish_app/constant/color.dart';
import 'package:stylish_app/constant/image.dart';
import 'package:stylish_app/screens/productDetail_screen/widget/build_product_buying_button.dart';
import 'package:stylish_app/screens/productDetail_screen/widget/build_product_deatil_chip.dart';
import 'package:stylish_app/widget/icon_container.dart';

import '../widget/build_carousel_image.dart';
import '../widget/build_size_chip.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: EdgeInsets.only(left: 18),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconContainer(imagePath: AppImage.cart),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CarouselSlider(
                  items: [
                    buildCarouselImage(
                      'https://images.pexels.com/photos/1598505/pexels-photo-1598505.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      context,
                    ),
                    buildCarouselImage(
                      'https://images.pexels.com/photos/273930/pexels-photo-273930.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      context,
                    ),
                    buildCarouselImage(
                      'https://images.pexels.com/photos/1456706/pexels-photo-1456706.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      context,
                    ),
                  ],
                  options: CarouselOptions(
                    autoPlay: false,
                    viewportFraction: 0.92,
                    height: MediaQuery.of(context).size.height * 0.28,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    autoPlayAnimationDuration: Duration(milliseconds: 1200),
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
                SizedBox(height: 10),
                AnimatedSmoothIndicator(
                  activeIndex: currentIndex,
                  count: 3,
                  effect: SlideEffect(
                    activeDotColor: AppColors.secondaryColor,
                    dotColor: AppColors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Size: 7UK',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily:
                          GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                          ).fontFamily,
                    ),
                  ),
                  SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      buildSizeChip('6 UK'),
                      buildSizeChip('7 UK'),
                      buildSizeChip('8 UK'),
                      buildSizeChip('9 UK'),
                      buildSizeChip('10 UK'),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// product title section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('NIke Sneakers'),
                  SizedBox(height: 8),
                  Text('Vision Alta Men’s Shoes Size (All Colours)'),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.3),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 2,
                      children: [
                        SvgPicture.asset(
                          AppImage.ratings,
                          width: 18,
                          height: 18,
                        ),
                        SvgPicture.asset(
                          AppImage.ratings,
                          width: 18,
                          height: 18,
                        ),
                        SvgPicture.asset(
                          AppImage.ratings,
                          width: 18,
                          height: 18,
                        ),
                        SvgPicture.asset(
                          AppImage.ratings,
                          width: 18,
                          height: 18,
                        ),
                        SvgPicture.asset(
                          AppImage.noRatings,
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(width: 8),
                        Text('56,890'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '₹2,999',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.4),
                          fontFamily:
                              GoogleFonts.montserrat(
                                fontWeight: FontWeight.normal,
                              ).fontFamily,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '₹1,500',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontFamily:
                              GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                              ).fontFamily,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '50% Off',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.secondaryColor,
                          fontFamily:
                              GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                              ).fontFamily,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Product Details',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                    ),
                  ),
                  SizedBox(height: 4),
                  ReadMoreText(
                    'Perhaps the most iconic sneaker of all time, the original “Chicago” colorway of the Air Jordan 1 is a legendary piece of sneaker history. First released in 1985 and made famous by Michael Jordan himself, this colorway has become the cornerstone of any serious sneaker collection. Its bold red, white, and black design not only captured the hearts of fans back then but has also stood the test of time, continuing to be celebrated by sneaker enthusiasts across generations.' +
                        'The 2015 re-release brought this classic back with updated materials and details, allowing a new wave of fans to experience the magic of the original. Today, the Chicago AJ1 remains the most iconic and sought-after colorway in the Air Jordan lineup.',
                    trimMode: TrimMode.Length,
                    colorClickableText: AppColors.secondaryColor,
                    trimCollapsedText: 'More',
                    trimExpandedText: 'Show less',
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      buildProductDetailsChip(
                        'Nearest Store',
                        Icons.location_on_outlined,
                      ),
                      SizedBox(width: 8),
                      buildProductDetailsChip('VIP', Icons.lock_outline),
                      SizedBox(width: 8),
                      buildProductDetailsChip(
                        'Return policy',
                        Icons.sync_outlined,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 46, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      buildProductBuyingButton(
                        'Go to cart',
                        Icons.shopping_cart,
                        AppColors.blueGradient,
                      ),
                      SizedBox(width: 50),
                      buildProductBuyingButton(
                        'Buy Now',
                        Icons.ads_click,
                        AppColors.greenGradient,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.sizeOf(context).width * .9,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.lightPink,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery in',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily:
                          GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                          ).fontFamily,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('1 within Hour', style: TextStyle(
                    fontSize: 21,
                    fontFamily:
                    GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                    ).fontFamily,
                  ),),
                ],
              ),
            ),
          ),
          
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: buildFeatureButton(Icons.remove_red_eye_outlined, 'View Similar')),
                  SizedBox(width: 3,),
                  Expanded(child: buildFeatureButton(Icons.send_to_mobile_outlined, 'Add to Compare')),
                ],
              ),
            )
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: 100,),
          )
        ],
      ),
    );
  }
}

Widget buildFeatureButton(IconData icon, String buttonText) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.transparent,
      border: Border.all(
        width: 1,
        color: Colors.black.withOpacity(0.2)
      )
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        SizedBox(width: 8,),
        Text(buttonText)
      ],
    ),
  );
}
