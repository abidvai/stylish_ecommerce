import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stylish_app/ProductModel.dart';
import 'package:stylish_app/constant/color.dart';
import 'package:stylish_app/constant/image.dart';
import 'package:stylish_app/constant/text.dart';
import 'package:stylish_app/screens/home_screen/model/home_model.dart';
import 'package:stylish_app/screens/home_screen/model/product_category.dart';
import 'package:stylish_app/screens/home_screen/widget/carousel_banner_section.dart';
import 'package:stylish_app/screens/home_screen/widget/category_section.dart';
import 'package:stylish_app/screens/home_screen/widget/summer_offer_container.dart';
import 'package:stylish_app/screens/productDetail_screen/screen/product_detail_screen.dart';
import 'package:stylish_app/screens/trending_product_screen.dart';
import 'package:stylish_app/services/product_service.dart';
import 'package:stylish_app/widget/app_bar.dart';
import 'package:stylish_app/widget/search_bar.dart';

import '../../../widget/item_filter_container.dart';
import '../../../widget/product_card.dart';
import '../widget/custom_banner_container.dart';
import '../widget/outline_banner.dart';
import '../widget/outline_button_widget.dart';
import '../widget/sponsor_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> images = [
    'https://images.pexels.com/photos/1050244/pexels-photo-1050244.jpeg',
    'https://images.pexels.com/photos/5957/gift-brown-shopping-market.jpg?cs=srgb&dl=pexels-kaboompics-5957.jpg&fm=jpg',
    'https://images.pexels.com/photos/2601274/pexels-photo-2601274.jpeg?auto=compress&cs=tinysrgb&w=800',
  ];

  int currentIndex = 0;

  late Future<ProductOfModel> futureProducts;
  late Future<List<ProductCategory>> futureCategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureProducts = ProductService.getProducts();
    futureCategory = ProductService.getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: CustomScrollView(
        slivers: [
          appBar(context),

          /// search bar
          SliverToBoxAdapter(child: buildSearchBar()),

          /// category text
          SliverToBoxAdapter(
            child: ItemFilterContainer(title: AppText.allFeatured),
          ),

          /// category widget
          SliverToBoxAdapter(
            child: FutureBuilder<List<ProductCategory>>(
              future: futureCategory,
              builder: (context, snapshot) {
                print('Building FutureBuilder. ConnectionState: ${snapshot.connectionState}');
                print('Has error: ${snapshot.hasError}');
                print('Has data: ${snapshot.hasData}');

                if (snapshot.connectionState == ConnectionState.waiting) {
                  print('Showing loading indicator');
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  print('Error: ${snapshot.error}');
                  return Center(child: Text("Error loading categories"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  print('No data available');
                  return Center(child: Text("No categories found"));
                }

                final categories = snapshot.data!;
                print('Categories loaded: ${categories.length} items');
                print('First category: ${categories.isNotEmpty ? categories[0].name : "N/A"}');

                return Container(
                  margin: EdgeInsets.only(left: 16),
                  height: MediaQuery.sizeOf(context).height * .12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 8, top: 14),
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 16);
                    },
                    itemBuilder: (context, index) {

                      final category = categories[index];
                      return Container(
                        width: 100,
                        alignment: Alignment.center,
                        child: Text(
                          category.slug ?? 'NO Category',
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    },
                  ),
                );
              },
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
                child: FutureBuilder(
                  future: futureProducts,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData) {
                      return const Center(child: Text('No products found'));
                    }

                    final products = snapshot.data!.products;

                    return ListView.separated(
                      padding: EdgeInsets.only(top: 16, right: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: products!.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 16);
                      },
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ProductCard(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(),
                              ),
                            );
                          },
                          product: product,
                          ratingActive: false,
                          cardWidth: MediaQuery.sizeOf(context).width * .42,
                        );
                      },
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TrendingProductScreen(),
                    ),
                  );
                },
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * .41,
              child: FutureBuilder(
                future: futureProducts,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData) {
                    return const Center(child: Text('No products found'));
                  }

                  final products = snapshot.data!.products;

                  return ListView.separated(
                    padding: EdgeInsets.only(top: 16, right: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: products!.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 16);
                    },
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(),
                            ),
                          );
                        },
                        product: product,
                        ratingActive: false,
                        cardWidth: MediaQuery.sizeOf(context).width * .42,
                      );
                    },
                  );
                },
              ),
            ),
          ),

          /// summer offer
          SliverToBoxAdapter(child: summerOfferContainer()),

          SliverToBoxAdapter(child: sponsorContainer(context)),
        ],
      ),
    );
  }
}
