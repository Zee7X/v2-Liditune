import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/rubik20.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Ganti Password'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: const Color(0xFF240B74),
        elevation: 0,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
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
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 10.7,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 19.7,
                right: MediaQuery.of(context).size.width / 19.7,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 2.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => TextField(
                          style: TextStyle(
                            color: Color(0xFF240B74),
                          ),
                          obscureText: controller.isPasswordHidden.value,
                          textInputAction: TextInputAction.next,
                          controller: controller.lamaC,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Color(0xFF240B74),
                            ),
                            hintText: 'Masukan Password Lama',
                            hintStyle: TextStyle(
                              color: Color(0xFF240B74),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xFF240B74),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xFF240B74),
                                width: 1,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                controller.isPasswordHidden.value =
                                    !controller.isPasswordHidden.value;
                              },
                              child: Icon(
                                color: Color(0xFF240B74),
                                Icons.remove_red_eye_outlined,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Obx(
                        () => TextField(
                          style: TextStyle(
                            color: Color(0xFF240B74),
                          ),
                          obscureText: controller.isPasswordHidden1.value,
                          textInputAction: TextInputAction.next,
                          controller: controller.baruC,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_clock_outlined,
                              color: Color(0xFF240B74),
                            ),
                            hintText: 'Masukan Password Baru',
                            hintStyle: TextStyle(
                              color: Color(0xFF240B74),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xFF240B74),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xFF240B74),
                                width: 1,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                controller.isPasswordHidden1.value =
                                    !controller.isPasswordHidden1.value;
                              },
                              child: Icon(
                                color: Color(0xFF240B74),
                                Icons.remove_red_eye_outlined,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Obx(
                        () => TextField(
                          style: TextStyle(
                            color: Color(0xFF240B74),
                          ),
                          obscureText: controller.isPasswordHidden2.value,
                          textInputAction: TextInputAction.next,
                          controller: controller.konfirmC,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_reset_rounded,
                              color: Color(0xFF240B74),
                            ),
                            hintText: 'Konfirmasi Password Baru',
                            hintStyle: TextStyle(
                              color: Color(0xFF240B74),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xFF240B74),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color(0xFF240B74),
                                width: 1,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                controller.isPasswordHidden2.value =
                                    !controller.isPasswordHidden2.value;
                              },
                              child: Icon(
                                color: Color(0xFF240B74),
                                Icons.remove_red_eye_outlined,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Obx(() => Center(
                            child: Container(
                              width: 269,
                              height: 45,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF6658FB),
                                    Color(0xFF8C58FB)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () async {
                                  if (controller.isLoading.isFalse) {
                                    controller.updatePass();
                                  }
                                },
                                child: Rubik20(
                                  text: controller.isLoading.isFalse
                                      ? 'Simpan'
                                      : 'Loading ...',
                                  fontweight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
