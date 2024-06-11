import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ngajidong/pages/home_screen.dart';
import 'package:ngajidong/theme.dart';
import 'package:svg_flutter/svg.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = 'splash_screen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "NgajiDong",
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.bold,
                  color: primary,
                  fontSize: 35
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Lupa baca qur'an? \nYang bener aje, Ngaji dong!",
                textAlign: TextAlign.center,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 15,
                  color: secondary
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 450,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primary,
                    borderRadius: BorderRadius.circular(30)
                    ),
                    child: SvgPicture.asset('assets/svg/splash.svg'),
                  ),
                  Positioned(
                  right: 0,
                  left: 0,
                  bottom: -20,
                  child: Center(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 56, vertical: 12),
                        decoration: BoxDecoration(
                          color: secondary,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          "Get Started",
                          style: GoogleFonts.plusJakartaSans(
                              fontSize: 18, fontWeight:FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}