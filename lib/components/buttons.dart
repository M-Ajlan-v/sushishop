import 'package:flutter/material.dart';
import 'package:sushishop/themes/colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  MyButton({
    super.key,
    required this.text,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: secondaryColor,
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10,),
            Icon(Icons.arrow_forward_ios,
            color: Colors.white,
            size: 16,
            )
          ],
        ),
      ),
    );
  }
}
