class ProductModel {
  final String imagePath;
  final String title;
  final String description;
  final String price;
  final String depricatedPrice;
  final String offerText;
  final String ratingCount;

  ProductModel({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.depricatedPrice,
    required this.offerText,
    required this.ratingCount
  });
}