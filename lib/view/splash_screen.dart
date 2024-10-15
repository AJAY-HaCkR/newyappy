import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/view/home/home_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      // Fade transition to HomeScreen
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white, // Set a background color
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.1), // Add some padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Title above the image
            Text(
              'news feed app',
              style: GoogleFonts.anton(
                fontSize: 36, // Increased font size
                letterSpacing: .6,
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(height: height * 0.04),
            Image.asset(
              'images/splash_pic.jpg',
              fit: BoxFit.cover,
              height: height * 0.4, // Adjusted height for better scaling
            ),
            SizedBox(height: height * 0.04),
            SpinKitChasingDots(
              color: Colors.blue,
              size: 40,
            ),
            SizedBox(height: height * 0.04), // Space below the loading indicator
            Text(
              'Loading...',
              style: GoogleFonts.lato(
                fontSize: 18,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
