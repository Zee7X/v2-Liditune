import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                      height: Get.height / 2.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
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
                            TextFormField(
                              style: TextStyle(
                                color: Color(0xFF240B74),
                              ),
                              controller: controller.nameController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Color(0xFF240B74),
                                ),
                                hintText: 'Masukan Nama',
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
                              ),
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              style: TextStyle(
                                color: Color(0xFF240B74),
                              ),
                              controller: controller.emailController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Color(0xFF240B74),
                                ),
                                hintText: 'Masukan Email',
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
                              ),
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              style: TextStyle(
                                color: Color(0xFF240B74),
                              ),
                              controller: controller.phoneController,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]'),
                                ),
                              ],
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.phone_android,
                                  color: Color(0xFF240B74),
                                ),
                                hintText: 'Masukan No Hp',
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
                              ),
                            ),
                            SizedBox(height: 16),
                            DropdownSearch<String>(
                              items: const ["Laki - Laki", "Perempuan"],
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                baseStyle: TextStyle(
                                  color: Color(0xFF240B74),
                                ),
                                dropdownSearchDecoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.male,
                                    color: Color(0xFF240B74),
                                  ),
                                  iconColor: Color(0xFF240B74),
                                  focusColor: Colors.transparent,
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
                                  fillColor: Colors.white,
                                  suffixIconColor: Color(0xFF240B74),
                                ),
                              ),
                              popupProps: const PopupProps.menu(
                                constraints: BoxConstraints(maxHeight: 100),
                                showSearchBox: false,
                                showSelectedItems: true,
                              ),
                              selectedItem: controller.genderController.text,
                              onChanged: (newValue) {
                                controller.setSelected(newValue!);
                              },
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
                                    backgroundColor: Colors.transparent,
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
