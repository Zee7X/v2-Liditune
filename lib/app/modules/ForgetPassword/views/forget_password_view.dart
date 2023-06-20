import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/rubik20.dart';
import '../../../utils/textfield_login.dart';
import '../controllers/forget_password_controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Rubik20(
          text: 'Lupa Password',
          color: Colors.white,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFF240B74),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 2.0),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF240B74),
              const Color(0xFF0A0B0D),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 20.7,
            right: MediaQuery.of(context).size.width / 20.7,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 10.7),
                Lottie.asset(
                  'assets/images/forgot.json',
                  height: 250.0,
                  fit: BoxFit.contain,
                ),
                Obx(() => SizedBox(
                      height: MediaQuery.of(context).size.height / 7.5,
                      child: Text(controller.isNotifikasi.value),
                    )),
                FormLogin(
                  namaController: controller.emailC,
                  textHintText: 'Masukan Email',
                  namaIcon: Icons.alternate_email,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 19.9),
                Obx(() => ElevatedButton(
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
                          await controller.sendEmail();
                        }
                      },
                      child: Rubik20(
                        text: controller.isLoading.isFalse
                            ? 'Reset'
                            : 'Loading ...',
                        fontweight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
