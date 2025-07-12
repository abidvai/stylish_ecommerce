import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stylish_app/screens/productDetail_screen/screen/product_detail_screen.dart';
import 'package:stylish_app/widget/item_filter_container.dart';
import 'package:stylish_app/widget/product_card.dart';
import 'package:stylish_app/widget/search_bar.dart';

import '../ProductModel.dart';
import '../constant/color.dart';
import '../services/product_service.dart';
import '../widget/app_bar.dart';

class TrendingProductScreen extends StatefulWidget {
  const TrendingProductScreen({super.key});

  @override
  State<TrendingProductScreen> createState() => _TrendingProductScreenState();
}

class _TrendingProductScreenState extends State<TrendingProductScreen> {
  late Future<ProductOfModel> futureProducts;
  final ScrollController _scrollController = ScrollController();
  bool _showFab = false;
  final double _scrollThreshold = 100.0;

  @override
  void initState() {
    super.initState();
    futureProducts = ProductService.getProducts();

    _scrollController.addListener(() {
      final direction = _scrollController.position.userScrollDirection;
      final offset = _scrollController.offset;

      if (direction == ScrollDirection.reverse && _showFab) {
        setState(() => _showFab = false);
      } else if (direction == ScrollDirection.forward &&
          offset > _scrollThreshold &&
          !_showFab) {
        setState(() => _showFab = true);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _refreshProducts() {
    setState(() {
      futureProducts = ProductService.getProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      floatingActionButton:
          _showFab
              ? FloatingActionButton(
                onPressed: _scrollToTop,
                backgroundColor: AppColors.primaryColor,
                elevation: 4.0,
                child: const Icon(Icons.arrow_upward, color: Colors.white),
              )
              : null,
      body: CustomScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        slivers: [
          appBar(context),

          /// search bar
          SliverToBoxAdapter(child: buildSearchBar()),

          /// category text
          SliverToBoxAdapter(
            child: ItemFilterContainer(title: '52,082+ Iteams'),
          ),

          SliverPadding(
            padding: EdgeInsets.only(top: 16, right: 16, bottom: 30),
            sliver: FutureBuilder<ProductOfModel>(
              future: futureProducts,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasError) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text('Error: ${snapshot.error}')),
                  );
                } else if (!snapshot.hasData ||
                    snapshot.data!.products == null) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text('No products found')),
                  );
                }

                final products = snapshot.data!.products!;
                return SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
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
                  }, childCount: products.length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.63,
                  ),
                );
              },
            ),
          ),

          SliverToBoxAdapter(
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

                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: ListView.separated(
                    padding: EdgeInsets.only(top: 16, right: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: products!.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 16);
                    },
                    itemBuilder: (context, index) {
                      final product = products[index];
                      print(
                        '----------------------------------  ${product.id}',
                      );
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
