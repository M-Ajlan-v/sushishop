import 'package:sushishop/models/food.dart';

class CartItem {
  final Food food;
  int quantity;

  CartItem({
    required this.food,
    required this.quantity,
  });
}