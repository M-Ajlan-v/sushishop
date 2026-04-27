import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushishop/components/buttons.dart';
import 'package:sushishop/models/food.dart';
import 'package:sushishop/models/shop.dart';

import '../themes/colors.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
   FoodDetailsPage({super.key,
    required this.food
  });

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {

  int quantityCount = 0;
  void decrementQnty(){
    setState(() {
      if(quantityCount > 0) {
        quantityCount--;
      }
      else {
        quantityCount = 0;
      }
    });
  }
  void incrementQnty(){
    setState(() {
      quantityCount++;
    });
  }
  void addToCart(){
    if(quantityCount>0){
      final shop =context.read<Shop>();
      shop.addToCart(widget.food, quantityCount);
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: primaryColor,
          content: Text("successfully added to cart", style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pop(context);
                Navigator.pop(context);
                }, icon: Icon(Icons.done, color: Colors.white,))
        ],
      ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
               children: [
                 Image.asset(widget.food.imagePath, height: 200,),
                 const SizedBox(height: 25,),
                  Row(
                    children: [
                      Icon(Icons.star,
                        color: rateColor,
                      ),
                      const SizedBox(width: 5),
                      Text(widget.food.rating,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                      ),
                    ],
                  ),
               //   food name
                 const SizedBox(height: 10),
               //   description
                 Text(widget.food.name,
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 28,
                    fontWeight: FontWeight.w500
                  ),
                 ),
                 const SizedBox(height: 25),
                 Text("Description",
                 style: TextStyle(
                   color: Colors.grey[900],
                   fontWeight: FontWeight.bold,
                   fontSize: 18
                 ),
                 ),
                 const SizedBox(height: 10,),
                 Text("This signature creation is masterfully balanced to provide an exceptional culinary journey that awakens the senses. "
                     "By blending contemporary innovation with established techniques, our kitchen delivers a unique interpretation of a timeless favorite. "
                     "We take pride in every detail, ensuring a dining experience that is as memorable as it is delicious.",
                 style: TextStyle(
                   color: Colors.grey[700],
                   height: 2
                 ),),
               ],
              ),
            )
          ),
          Container(
            padding: EdgeInsets.all(25),
            color: primaryColor,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$" + widget.food.price,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: secondaryColor,
                          ),
                          child: IconButton(
                            onPressed: decrementQnty,
                            icon: Icon(Icons.remove,
                            color: Colors.white,),
                          ),
                        ),
                        SizedBox(
                            width: 40,
                          child: Center(
                            child: Text(quantityCount.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: secondaryColor,
                          ),
                          child: IconButton(
                            onPressed: incrementQnty,
                            icon: Icon(Icons.add,
                            color: Colors.white,),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
                const SizedBox(height: 25,),
                MyButton(text: "Add to Cart", onTap: addToCart)
              ],
            ),
          )
        ],
      ),
    );
  }
}
