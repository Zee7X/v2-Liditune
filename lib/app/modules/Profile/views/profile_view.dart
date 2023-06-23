import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Profile'),
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
        child: Obx(
          () {
            final currentUser = controller.currentUser.value;
            final userProfile = controller.userProfile.value;
            final isLoading = controller.isLoading.value;

            if (currentUser == null || userProfile == null) {
              return Center(
                child: Text(''),
              );
            }

            if (isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 100,
                        child: Stack(
                          children: [
                            if (userProfile['profileImg'].isNotEmpty)
                              ClipOval(
                                child: Image.network(
                                  userProfile['profileImg'],
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            Positioned(
                              bottom: 0,
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                  controller.pickImage();
                                },
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Color(0XFF15D863),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                            if (userProfile['profileImg'].isNotEmpty)
                              Positioned(
                                bottom: 0,
                                left: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.deleteImage();
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Color(0XFFFF3589),
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            if (userProfile['profileImg'].isEmpty)
                              Center(
                                child: Text(
                                  controller.getImagePlaceholder(
                                      controller.nameController.text),
                                  style: TextStyle(
                                    fontSize: 80,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: Get.width,
                      height: Get.height / 2.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                color: Color(0xFF240B74),
                              ),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: controller.nameController,
                                decoration: InputDecoration(
                                  labelText: 'Nama',
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
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                color: Color(0xFF240B74),
                              ),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: controller.emailController,
                                decoration: InputDecoration(
                                  labelText: 'Email',
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
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                color: Color(0xFF240B74),
                              ),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: controller.phoneController,
                                decoration: InputDecoration(
                                  labelText: 'No Hp',
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
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                color: Color(0xFF240B74),
                              ),
                              child: TextFormField(
                                style: TextStyle(color: Colors.white),
                                controller: controller.genderController,
                                decoration: InputDecoration(
                                  labelText: 'Jenis Kelamin',
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
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.CHANGE_PASSWORD);
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: 'Ganti Password',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                width: Get.width / 2,
                                height: Get.height / 18,
                                child: ElevatedButton(
                                  onPressed: () {
                                    controller.updateUserProfile();
                                  },
                                  child: Text(
                                    'Update',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Color(0xFF240B74),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
