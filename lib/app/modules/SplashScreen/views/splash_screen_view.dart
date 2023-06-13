import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:literasi_digital_tuna_netra/app/modules/home/views/home_view.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    controller.speakText(
      'Selamat Datang Di Aplikasi Liditune, Literasi Digital Tuna Netra, Dengarkan, Positifkan Pikiran Dengan Membuka Jendala Dunia Melalui Pendengaran',
    );
    return AnimatedSplashScreen(
      splash: 'assets/images/splash.png',
      splashIconSize: 400,
      nextScreen: HomeView(),
      backgroundColor: Colors.black,
      duration: 12000,
    );
  }
}
