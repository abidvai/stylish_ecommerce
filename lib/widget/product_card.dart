
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_app/ProductModel.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.ratingActive,
    required this.cardWidth,
    this.onTap,
  });

  final Products product;
  final bool ratingActive;
  final double cardWidth;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth,
        margin: EdgeInsets.only(left: 16, right: 2),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * .45,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(6),
                topLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
                bottomLeft: Radius.circular(6),
              ),
              child: Image.network(
                product.thumbnail!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: max(100, MediaQuery.sizeOf(context).height) * .20,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 4, right: 4, bottom: 4, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title!,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily:
                      GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                      ).fontFamily,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    product.description!,
                    maxLines: 2,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 10,
                      fontFamily:
                      GoogleFonts.montserrat(
                        fontWeight: FontWeight.normal,
                      ).fontFamily,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('${product.price}',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily:
                      GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                      ).fontFamily,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        '${product.discountPercentage}',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.black.withOpacity(0.3),
                          fontFamily:
                          GoogleFonts.montserrat(
                            fontWeight: FontWeight.normal,
                          ).fontFamily,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'hardcore 40%',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily:
                          GoogleFonts.montserrat(
                            fontWeight: FontWeight.normal,
                          ).fontFamily,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  if (ratingActive)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 14,),
                            Icon(Icons.star, color: Colors.orange, size: 14,),
                            Icon(Icons.star, color: Colors.orange, size: 14,),
                            Icon(Icons.star, color: Colors.orange, size: 14,),
                            Icon(Icons.star_half, color: Colors.grey, size: 14,),
                          ],
                        ),
                        SizedBox(width: 4),
                        Text(
                          '200',
                          style: TextStyle(color: Colors.black.withOpacity(0.5)),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
