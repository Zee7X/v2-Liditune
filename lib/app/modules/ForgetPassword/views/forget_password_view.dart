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
      backgroundColor: const Color(0XFF8058FB),
      appBar: AppBar(
        title: Rubik20(
          text: 'Lupa Password',
          color: Colors.white,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0XFF8058FB),
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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 20.7,
          right: MediaQuery.of(context).size.width / 20.7,
        ),
        child: SingleChildScrollView(
          child: Column(
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
                  namaIcon: Icons.alternate_email),
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
                        // controller.resetFields();
                      }
                    },
                    child: Rubik20(
                      text: controller.isLoading.isFalse
                          ? 'Kirim'
                          : 'Loading ...',
                      fontweight: FontWeight.w500,
                      color: const Color(0XFF026ca0),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
