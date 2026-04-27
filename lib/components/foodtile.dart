import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/food.dart';
import '../themes/colors.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  FoodTile({
    required this.food,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 25),
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
                food.imagePath,
              height: 100,
            ),
            Text(food.name,
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
            ),

            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text('\$' + food.price,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey

                  ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star,
                      color: rateColor,),
                      Text(food.rating,
                          style: TextStyle(
                              color: Colors.grey)
                      )
                    ],),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
