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
                height: MediaQuery.of(context).size.height / 2.4,
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
                      Obx(() => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              color: Color(0xFF240B74),
                            ),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              obscureText: controller.isPasswordHidden.value,
                              textInputAction: TextInputAction.next,
                              controller: controller.lamaC,
                              decoration: InputDecoration(
                                labelText: 'Masukan Password Lama',
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
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
                                    color: Colors.white,
                                    Icons.remove_red_eye_outlined,
                                  ),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 16,
                      ),
                      Obx(() => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              color: Color(0xFF240B74),
                            ),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              obscureText: controller.isPasswordHidden1.value,
                              textInputAction: TextInputAction.next,
                              controller: controller.baruC,
                              decoration: InputDecoration(
                                labelText: 'Masukan Password Baru',
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
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
                                    color: Colors.white,
                                    Icons.remove_red_eye_outlined,
                                  ),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 16,
                      ),
                      Obx(() => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              color: Color(0xFF240B74),
                            ),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              obscureText: controller.isPasswordHidden2.value,
                              textInputAction: TextInputAction.next,
                              controller: controller.konfirmC,
                              decoration: InputDecoration(
                                labelText: 'Konfirmasi Password Baru',
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
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
                                    color: Colors.white,
                                    Icons.remove_red_eye_outlined,
                                  ),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 13.5,
                      ),
                      Obx(() => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 2,
                              shadowColor: Colors.black,
                              backgroundColor: Color(0xFF240B74),
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
