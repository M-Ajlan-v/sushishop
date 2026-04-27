import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushishop/components/buttons.dart';
import 'package:sushishop/components/foodtile.dart';
import 'package:sushishop/models/food.dart';
import 'package:sushishop/pages/food_details.dart';
import 'package:sushishop/themes/colors.dart';

import '../models/shop.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  void navigateToFoodDetails(int index){

    final shop= context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(context, MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),

    ));
  }
  
  @override
  Widget build(BuildContext context) {

    final shop= context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu,
        color: Colors.black,
        ),
        centerTitle: true,
        title: Text("Tokyo",
        style: GoogleFonts.dmSerifDisplay(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.grey[900]
        ),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/cartpage');
          }, icon: Icon(Icons.shopping_cart))
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        //   banner
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Get 32% Promo",
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    MyButton(text: "Redeem Now!", onTap: (){})
                  ],
                ),
                Image.asset('lib/images/many_sushi.png', height: 100,)
              ],
            ),
          ),
        const SizedBox(height: 15),
        //   search
          Padding(
            padding: const EdgeInsets.all(25),
            child: TextField(

              decoration: InputDecoration(
                hintText: "Type to Search",
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20),
                )
              ),
            ),
          ),
        const SizedBox(height: 15),
        //   menu
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
                "Food Menu",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.bold
                ),
            ),
          ),
        const SizedBox(height: 10),
        //   popular
          Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: foodMenu.length,
                itemBuilder: (context, index)=> FoodTile(
                  onTap: () => navigateToFoodDetails(index),
                  food: foodMenu[index],
                ),
              )
          ),

          const SizedBox(
            height:25 ,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20)
            ),
            margin: EdgeInsets.only(bottom: 25, right: 25, left: 25 ),
            padding: EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('lib/images/salmon_eggs.png', height: 60,),
                    const SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Salmon eggs",
                        style: GoogleFonts.dmSerifDisplay(
                          fontSize: 18
                        ),
                        ),
                        const SizedBox(height: 10,),
                        Text('\$23',
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ],
                ),
                Icon(Icons.favorite_outline,
                color: Colors.grey[700],
                size: 16,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
