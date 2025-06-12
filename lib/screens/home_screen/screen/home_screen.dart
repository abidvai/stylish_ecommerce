import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylish_app/constant/color.dart';
import 'package:stylish_app/constant/image.dart';
import 'package:stylish_app/constant/text.dart';
import 'package:stylish_app/screens/home_screen/model/home_model.dart';
import 'package:stylish_app/screens/home_screen/model/product_model.dart';
import 'package:stylish_app/screens/productDetail_screen/screen/product_detail_screen.dart';
import 'package:stylish_app/screens/trending_product_screen.dart';
import 'package:stylish_app/widget/app_bar.dart';
import 'package:stylish_app/widget/search_bar.dart';
import '../../../widget/icon_container.dart';
import '../../../widget/item_filter_container.dart';
import '../../../widget/product_card.dart';
import '../widget/custom_banner_container.dart';
import '../widget/outline_banner.dart';
import '../widget/outline_button_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<HomeModel> category = [
    HomeModel(title: 'Beauty', imagePath: AppImage.beauty),
    HomeModel(title: 'Fashion', imagePath: AppImage.fashion),
    HomeModel(title: 'Kids', imagePath: AppImage.kids),
    HomeModel(title: 'Mens', imagePath: AppImage.mens),
    HomeModel(title: 'Womens', imagePath: AppImage.womens),
  ];

  final List<String> images = [
    'https://images.pexels.com/photos/1050244/pexels-photo-1050244.jpeg',
    'https://images.pexels.com/photos/5957/gift-brown-shopping-market.jpg?cs=srgb&dl=pexels-kaboompics-5957.jpg&fm=jpg',
    'https://images.pexels.com/photos/2601274/pexels-photo-2601274.jpeg?auto=compress&cs=tinysrgb&w=800',
  ];

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
  ];


  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: CustomScrollView(
        slivers: [
          appBar(context),

          /// search bar
          SliverToBoxAdapter(
            child: buildSearchBar()
          ),

          /// category text
          SliverToBoxAdapter(
            child: ItemFilterContainer(title: AppText.allFeatured),
          ),

          /// category widget
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(left: 16),
              height: MediaQuery.sizeOf(context).height * .12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ListView.separated(
                padding: EdgeInsets.only(left: 8, top: 14),
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 16);
                },
                itemBuilder: (context, index) {
                  final productCategory = category[index];
                  return Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Column(
                      children: [
                        Image.asset(productCategory.imagePath),
                        Text(productCategory.title),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          /// banner section carousel
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                    child: CarouselSlider(
                      items: [
                        CustomBannerContainer(
                          title: '50-40% OFF',
                          subtitle: 'Now in (product)',
                          description: 'All colours',
                          buttonText: 'Shop now',
                          icon: Icons.arrow_forward_outlined,
                          imagePath: images[0],
                        ),
                        CustomBannerContainer(
                          title: '20-40% OFF',
                          subtitle: 'Now in Stock',
                          description: 'All colours',
                          buttonText: 'Shop now',
                          icon: Icons.arrow_forward_outlined,
                          imagePath: images[1],
                        ),
                        CustomBannerContainer(
                          title: '10-40% OFF',
                          subtitle: 'Now in (product)',
                          description: 'All colours',
                          buttonText: 'Shop now',
                          icon: Icons.arrow_forward_outlined,
                          imagePath: images[2],
                        ),
                      ],
                      options: CarouselOptions(
                        height: MediaQuery.sizeOf(context).height * 0.18,
                        viewportFraction: 2,
                        initialPage: 0,
                        autoPlay: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 1200),
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                AnimatedSmoothIndicator(
                  activeIndex: currentIndex,
                  count: 3,
                  effect: SlideEffect(
                    activeDotColor: AppColors.secondaryColor,
                    dotColor: AppColors.grey,
                    dotHeight: 9,
                    dotWidth: 9,
                  ),
                ),
              ],
            ),
          ),

          /// promotional section
          SliverToBoxAdapter(
            child: OutlineBanner(
              title: 'Deal of the Day',
              icon: Icons.timer_outlined,
              description: '22h 55m 20s remaining',
            ),
          ),

          /// view Product List
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * .44,
              child: IntrinsicHeight(
                child: ListView.separated(
                  padding: EdgeInsets.only(top: 16, right: 7),
                  scrollDirection: Axis.horizontal,
                  itemCount: productList.length,
                  separatorBuilder: (index, context) {
                    return SizedBox(width: 12);
                  },
                  itemBuilder: (context, index) {
                    final product = productList[index];
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: ProductCard(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailScreen()));
                        },
                        product: product,
                        ratingActive: true,
                        cardWidth: MediaQuery.sizeOf(context).width * .42,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          /// Banner Section outline
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Image.asset(AppImage.offerImage, width: 80, height: 80),
                  SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Special Offers',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily:
                                    GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                    ).fontFamily,
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Text('😱'),
                            ),
                          ],
                        ),
                        Text(
                          'We make sure you get the offer you need at best prices',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily:
                                GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                ).fontFamily,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// banner section
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(right: 4, left: 16, top: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Image.asset(AppImage.bannerDecoration),
                  Positioned(
                    left: 26,
                    top: 32,
                    child: Image.asset(AppImage.womanShoe),
                  ),
                  Positioned(
                    child: Container(
                      width: 10,
                      height: 160,
                      decoration: BoxDecoration(color: Colors.orangeAccent),
                    ),
                  ),
                  Positioned(
                    top: 35,
                    right: 19,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        children: [
                          Text(
                            'Flat and Heels',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily:
                                  GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                  ).fontFamily,
                            ),
                          ),
                          Text(
                            'Stand a chance to get rewarded',
                            style: TextStyle(
                              fontSize: 10,
                              fontFamily:
                                  GoogleFonts.montserrat(
                                    fontWeight: FontWeight.normal,
                                  ).fontFamily,
                            ),
                          ),
                          SizedBox(height: 14),
                          Align(
                            alignment: Alignment.centerRight,
                            child: OutlineButtonWidget(
                              bgColor: AppColors.secondaryColor,
                              borderColor: Colors.transparent,
                              buttonText: 'Visit now',
                              icon: Icons.arrow_forward_outlined,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// banner 2nd
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 16),
              child: OutlineBanner(
                title: 'Trending Products ',
                icon: Icons.calendar_month_outlined,
                description: 'Last Date 29/02/22',
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TrendingProductScreen()));
                },
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * .41,
              child: ListView.separated(
                padding: EdgeInsets.only(top: 16, right: 16),
                scrollDirection: Axis.horizontal,
                itemCount: productList.length,
                separatorBuilder: (context, index) {
                  return SizedBox(width: 16);
                },
                itemBuilder: (context, index) {
                  final product = productList[index];
                  return ProductCard(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailScreen()));
                    },
                    product: product,
                    ratingActive: false,
                    cardWidth: MediaQuery.sizeOf(context).width * .42,
                  );
                },
              ),
            ),
          ),

          /// summer offer
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              padding: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Material(
                clipBehavior: Clip.none,
                borderRadius: BorderRadius.circular(10),
                elevation: 1,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                        child: Image.asset(
                          AppImage.summerOffer,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 8),
                      Padding(
                        padding: EdgeInsets.only(left: 8, right: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'New Arrivals',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily:
                                        GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                        ).fontFamily,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  'Summer’ 25 Collections',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily:
                                        GoogleFonts.montserrat(
                                          fontWeight: FontWeight.normal,
                                        ).fontFamily,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 26),
                              child: OutlineButtonWidget(
                                buttonText: 'View all',
                                icon: Icons.arrow_forward_outlined,
                                bgColor: AppColors.secondaryColor,
                                borderColor: Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(
                left: 16,
                right: 15,
                top: 10,
                bottom: 100,
              ),
              padding: EdgeInsets.only(top: 8, left: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sponserd'),
                  SizedBox(height: 12),
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://images.pexels.com/photos/137603/pexels-photo-137603.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.20,
                        top: MediaQuery.of(context).size.height * 0.02,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 50,
                              child: Divider(thickness: 2, color: Colors.white),
                            ),
                            SizedBox(width: 4),
                            Text(
                              'UP TO',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily:
                                    GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                    ).fontFamily,
                              ),
                            ),
                            SizedBox(width: 4),
                            SizedBox(
                              width: 50,
                              child: Divider(thickness: 2, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left:
                            MediaQuery.of(context).size.width *
                            0.29, // 30% from left
                        top:
                            MediaQuery.of(context).size.height *
                            0.06, // 2% from top
                        child: Text(
                          '50% OFF',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily:
                                GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                ).fontFamily,
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * .1,
                        left: MediaQuery.of(context).size.width * 0.30,
                        child: SizedBox(
                          width: 100,
                          child: Divider(thickness: 2, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'up to 50% Off',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily:
                              GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                              ).fontFamily,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(Icons.arrow_forward_ios_rounded, size: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
