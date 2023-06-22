import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/rubik16.dart';
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
                      Rubik16(
                        text: 'Nama',
                        fontsize: 12,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 29.8,
                        child: TextField(
                          textInputAction: TextInputAction.next,
                          controller: controller.namaC,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 15.5,
                      ),
                      Rubik16(
                        text: 'Email',
                        fontsize: 12,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 29.8,
                        child: TextField(
                          textInputAction: TextInputAction.next,
                          controller: controller.emailC,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 15.5,
                      ),
                      Rubik16(
                        text: 'No Hp',
                        fontsize: 12,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 29.8,
                        child: TextField(
                          textInputAction: TextInputAction.next,
                          controller: controller.noC,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 15.5,
                      ),
                      Rubik16(
                        text: 'Jenis Kelamin',
                        fontsize: 12,
                      ),
                      DropdownSearch<String>(
                        items: const ["Laki - Laki", "Perempuan"],
                        dropdownDecoratorProps: const DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            focusColor: Colors.blue,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
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
                        height: MediaQuery.of(context).size.height / 15.5,
                      ),
                      Rubik16(
                        text: 'Password',
                        fontsize: 12,
                      ),
                      SizedBox(
                        height: 30,
                        child: Obx(
                          () => TextField(
                            textInputAction: TextInputAction.done,
                            obscureText: controller.isPasswordHidden.value,
                            decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: () {
                                  controller.isPasswordHidden.value =
                                      !controller.isPasswordHidden.value;
                                },
                                child: const Icon(
                                  Icons.remove_red_eye_outlined,
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
