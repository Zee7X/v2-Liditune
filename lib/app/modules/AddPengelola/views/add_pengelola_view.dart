import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15.7,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
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
                  padding: const EdgeInsets.all(20),
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
                          controller: controller.namaC,
                          decoration: InputDecoration(
                            labelText: 'Masukan Nama',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
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
                          controller: controller.emailC,
                          decoration: InputDecoration(
                            labelText: 'Masukan Email',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
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
                          controller: controller.noC,
                          decoration: InputDecoration(
                            labelText: 'Masukan No Hp',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: Color(0xFF240B74),
                        ),
                        child: DropdownSearch<String>(
                          items: const ["Laki - Laki", "Perempuan"],
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            baseStyle: TextStyle(color: Colors.white),
                            dropdownSearchDecoration: InputDecoration(
                              iconColor: Colors.white,
                              labelText: "Pilih Jenis Kelamin",
                              labelStyle: TextStyle(color: Colors.white),
                              focusColor: Colors.transparent,
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              fillColor: Colors.white,
                              suffixIconColor: Colors.white,
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
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Obx(
                        () => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            color: Color(0xFF240B74),
                          ),
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            textInputAction: TextInputAction.done,
                            obscureText: controller.isPasswordHidden.value,
                            decoration: InputDecoration(
                              labelText: 'Password',
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
                                child: const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            controller: controller.passC,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20.8,
                ),
                Obx(
                  () => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.3,
                      shadowColor: Colors.grey.withOpacity(0.2),
                      backgroundColor: const Color(0xFF240B74),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
