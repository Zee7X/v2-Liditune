import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../utils/rubik20.dart';
import '../controllers/add_pengelola_controller.dart';

class AddPengelolaView extends GetView<AddPengelolaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Rubik20(
          text: 'Tambah Pengelola',
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
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
      body: Container(
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
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20,
            top: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: Get.width,
                height: Get.height / 2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 0.5,
                      blurRadius: 1,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      style: TextStyle(
                        color: Color(0xFF240B74),
                      ),
                      controller: controller.namaC,
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
                      controller: controller.emailC,
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
                      controller: controller.noC,
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
                    SizedBox(
                      height: 16,
                    ),
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
                          hintText: 'Pilih Jenis Kelamin',
                          hintStyle: TextStyle(
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
                      onChanged: (newValue) {
                        controller.setSelected(newValue!);
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Obx(
                      () => TextField(
                        style: TextStyle(
                          color: Color(0xFF240B74),
                        ),
                        textInputAction: TextInputAction.done,
                        obscureText: controller.isPasswordHidden.value,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xFF240B74),
                          ),
                          hintText: 'Masukan Password',
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
                            child: const Icon(
                              Icons.remove_red_eye_outlined,
                              color: Color(0xFF240B74),
                            ),
                          ),
                        ),
                        controller: controller.passC,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Obx(
                      () => Center(
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
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () async {
                              if (controller.isLoading.isFalse) {
                                await controller.daftarUser();
                              }
                            },
                            child: Rubik20(
                              text: controller.isLoading.isFalse
                                  ? 'Submit'
                                  : 'Loading ...',
                              fontweight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
