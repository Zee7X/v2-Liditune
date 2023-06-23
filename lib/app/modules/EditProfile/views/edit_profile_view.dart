import 'package:flutter/material.dart';
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
        title: Text('Edit Profile'),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  controller.nama.value = value;
                },
                initialValue: controller.nama.value,
                decoration: InputDecoration(
                  labelText: 'Nama',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                onChanged: (value) {
                  controller.gender.value = value;
                },
                initialValue: controller.gender.value,
                decoration: InputDecoration(
                  labelText: 'Gender',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                onChanged: (value) {
                  controller.no.value = value;
                },
                initialValue: controller.no.value,
                decoration: InputDecoration(
                  labelText: 'No',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  controller.updateProfile(pengelola.documentId);
                },
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
