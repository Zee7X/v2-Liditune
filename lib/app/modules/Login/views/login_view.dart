import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:literasi_digital_tuna_netra/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/rubik16.dart';
import '../../../utils/rubik20.dart';
import '../../../utils/textfield_login.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: const Color(0XFF8058FB),
        elevation: 0,
      ),
      backgroundColor: const Color(0XFF8058FB),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 20.7,
              right: MediaQuery.of(context).size.width / 20.7,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Selamat Datang!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10.7,
                  ),
                  Lottie.asset(
                    'assets/images/duck.json',
                    height: 250.0,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 14.2,
                  ),
                  FormLogin(
                    textInputAction: TextInputAction.next,
                    namaController: controller.emailC,
                    namaIcon: Icons.email,
                    textHintText: 'Masukan Email',
                  ),
                  const SizedBox(height: 25),
                  Obx(() => FormLogin(
                        obsecure: controller.isPasswordHidden.value,
                        textInputAction: TextInputAction.done,
                        namaController: controller.passC,
                        namaIcon: Icons.lock,
                        textHintText: 'Password',
                        suffixicon1: InkWell(
                          onTap: () {
                            controller.isPasswordHidden.value =
                                !controller.isPasswordHidden.value;
                          },
                          child: const Icon(
                            Icons.remove_red_eye_outlined,
                          ),
                        ),
                      )),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => Get.toNamed(Routes.FORGET_PASSWORD),
                        child: Rubik16(text: 'Lupa Password?'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40.0),
                  Obx(
                    () => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0.3,
                        shadowColor: Colors.grey.withOpacity(0.2),
                        backgroundColor: const Color(0XFFffdf0a),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        minimumSize: Size(
                          Get.width,
                          MediaQuery.of(context).size.height / 16.2,
                        ),
                      ),
                      onPressed: () async {
                        if (controller.isLoading.isFalse) {
                          await controller.login();
                        }
                      },
                      child: Rubik20(
                        text: controller.isLoading.isFalse
                            ? 'Login'
                            : 'LOADING ...',
                        fontweight: FontWeight.w500,
                        color: const Color(0XFF026ca0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
