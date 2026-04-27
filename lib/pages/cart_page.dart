import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushishop/components/buttons.dart';
import 'package:sushishop/models/food.dart';
import 'package:sushishop/models/shop.dart';
import 'package:sushishop/themes/colors.dart';
import 'package:sushishop/models/CartItem.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder: (context, value, child)=> Scaffold(

      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new)
        ),
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text("My Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: value.cartMenu.length,
                itemBuilder: (context, index){
              //   get food from cart,
              final item = value.cartMenu[index];
              //   get food name
              final String foodName = item.food.name;
              //   get food price
              final String  foodPrice = item.food.price;
              //   get food image
              final String foodImage = item.food.imagePath;

              return Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: secondaryColor,
                ),
                child: ListTile(

                  leading: Image.asset(foodImage, height: 50,),
                  title: Text("$foodName  x${item.quantity}", style: TextStyle(color: Colors.white, fontWeight:FontWeight(800)),),
                  subtitle: Text( '\$' +foodPrice, style: TextStyle(color: Colors.white70, fontWeight:FontWeight(500))),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: (){
                          value.removeFromCart(item.food);
                        },
                        icon: Icon(Icons.remove, color: Colors.white,),
                      ),
                      const SizedBox(width: 10,),
                      IconButton(
                        onPressed: (){
                          value.addToCart(item.food, 1);
                        },
                        icon: Icon(Icons.add, color: Colors.white,),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              child: MyButton(text: "Pay Now ", onTap: (){})
            ),
          )
        ],
      ),
    ),
    );
  }
}
