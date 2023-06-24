import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Pengelola/controllers/pengelola_controller.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  final Pengelola pengelola = Get.arguments as Pengelola;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Edit Pengelola'),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: Get.width,
              height: Get.height / 2.8,
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
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        controller.nama.value = value;
                      },
                      initialValue: controller.nama.value,
                      style: TextStyle(
                        color: Color(0xFF240B74),
                      ),
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
                    SizedBox(height: 16.0),
                    TextFormField(
                      onChanged: (value) {
                        controller.no.value = value;
                      },
                      initialValue: controller.no.value,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9]'),
                        ),
                      ],
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                        color: Color(0xFF240B74),
                      ),
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
                    SizedBox(height: 16.0),
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
                      selectedItem: controller.gender.value,
                      onChanged: (newValue) {
                        controller.setSelected(newValue!);
                      },
                    ),
                    SizedBox(height: 30.0),
                    Center(
                      child: Container(
                        width: 269,
                        height: 45,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF6658FB), Color(0xFF8C58FB)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            controller.updateProfile(pengelola.documentId);
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
          ),
        ),
      ),
    );
  }
}
