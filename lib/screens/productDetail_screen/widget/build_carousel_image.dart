import 'package:flutter/material.dart';

Widget buildCarouselImage(String imageUrl, BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 4),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(26),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: Image.network(
        imageUrl,
        fit: BoxFit.contain,
        height: MediaQuery.sizeOf(context).height * 0.20,
        width: double.infinity,
      ),
    ),
  );
}
