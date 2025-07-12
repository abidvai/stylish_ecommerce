
import'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget sponsorContainer(BuildContext context) {
  return Container(
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
  );
}
