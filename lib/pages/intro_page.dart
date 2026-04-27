import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushishop/pages/menupage.dart';
import 'package:sushishop/themes/colors.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState(
    );
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
      context, MaterialPageRoute(
        builder: (context) => const MenuPage()
      ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body:Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25,),
            Text(
              "SUSHI SPOT",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold
              )
            ),
            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.all(50),
              child: Image.asset('lib/images/salmon_eggs.png'),
            ),
            Column(
              children: [
                Text(
                  "THE HEART OF JAPANESE DINING",
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                    "simple ingredients crafted with care to create the perfect dining experience",
                    style: TextStyle(
                        color: Colors.white70,
                        height: 2
                    )
                ),
              ],
            ),
            const SizedBox(height: 50,),
          ],
        ),
      )
    );
  }
}
