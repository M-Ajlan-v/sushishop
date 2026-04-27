import 'package:flutter/widgets.dart';
import 'package:sushishop/models/CartItem.dart';
import 'food.dart';

class Shop extends ChangeNotifier{
  final List<Food> _foodMenu =[
    Food(
      name: "Salmon Sushi",
      price: "23.00",
      imagePath: 'lib/images/salmon_sushi.png',
      rating: "4.8",
    ),

    Food(
      name: "Tuna Sushi",
      price: "21.00",
      imagePath: 'lib/images/tuna.png',
      rating: "4.3",
    ),

    Food(
      name: "Salmon Eggs",
      price: "25.00",
      imagePath: 'lib/images/salmon_eggs.png',
      rating: "4.7",
    ),

    Food(
      name: "Sushi Combo Plate",
      price: "35.00",
      imagePath: 'lib/images/many_sushi.png',
      rating: "4.8",
    ),

    Food(
      name: "Salmon Sushi Deluxe",
      price: "28.00",
      imagePath: 'lib/images/salmon_sushi.png',
      rating: "4.9",
    ),

    Food(
      name: "Spicy Tuna Roll",
      price: "24.00",
      imagePath: 'lib/images/tuna.png',
      rating: "4.5",
    ),

    Food(
      name: "Family Sushi Set",
      price: "45.00",
      imagePath: 'lib/images/many_sushi.png',
      rating: "4.9",
    ),

    Food(
      name: "Salmon Eggs Premium",
      price: "30.00",
      imagePath: 'lib/images/salmon_eggs.png',
      rating: "4.9",
    ),

    Food(
      name: "Tuna Deluxe",
      price: "26.00",
      imagePath: 'lib/images/tuna.png',
      rating: "4.6",
    ),

    Food(
      name: "Salmon Sushi Combo",
      price: "32.00",
      imagePath: 'lib/images/salmon_sushi.png',
      rating: "4.7",
    ),

    Food(
      name: "Party Sushi Platter",
      price: "55.00",
      imagePath: 'lib/images/many_sushi.png',
      rating: "5.0",
    ),

  ];
  List<CartItem> _cart =[];

  List<Food> get foodMenu => _foodMenu;
  List<CartItem> get cartMenu => _cart;

  void addToCart(Food food, int quantity){
    int index = _cart.indexWhere((item) => item.food == food);
    if(index != -1){
      _cart[index].quantity+=quantity;
    }else{
      _cart.add(
          CartItem(
              food: food,
              quantity: quantity
          )
      );

    }
    notifyListeners();
  }

  void removeFromCart(Food food){
    int index = _cart.indexWhere((item) => item.food == food);
    if(index != -1){
      if(_cart[index].quantity >1){
        _cart[index].quantity--;
      }else{
        _cart.removeAt(index);
      }
    }
    notifyListeners();
  }
}

