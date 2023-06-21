import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../controllers/literatur_admin_controller.dart';

class LiteraturAdminView extends GetView<LiteraturAdminController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Literatur'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
            controller.onBackPressed();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_book),
            onPressed: () {
              Get.toNamed(Routes.ADD_LITERATUR);
              controller.onBackPressed();
            },
          ),
        ],
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
        child: RefreshIndicator(
          onRefresh: () async {
            await controller.fetchUploadedData();
          },
          child: Obx(() {
            if (controller.uploadedLiteratures.isEmpty) {
              return Center(
                  child: Text(
                'Tidak Ada Data Literatur',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ));
            } else {
              return ListView.builder(
                itemCount: controller.uploadedLiteratures.length,
                itemBuilder: (context, index) {
                  final literature = controller.uploadedLiteratures[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: Get.height / 8,
                      decoration: BoxDecoration(
                        color: Color(0xFF252835),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: ListTile(
                          title: Text(
                            literature.title,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          subtitle: Text(
                            literature.name,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          leading: Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(literature.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  final updatedLiterature =
                                      await getLiteratureData(
                                          literature.documentId);
                                  if (updatedLiterature != null) {
                                    Get.toNamed(Routes.EDIT_LITERATUR,
                                        arguments: updatedLiterature);
                                  } else {
                                    print('Tidak Ada Data');
                                  }
                                },
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 16),
                              GestureDetector(
                                onTap: () {
                                  controller
                                      .deleteLiteratur(literature.documentId);
                                },
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 16),
                              IconButton(
                                icon: literature.isPlaying
                                    ? Icon(
                                        Icons.stop,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                onPressed: () {
                                  controller.playLiteratureAudio(literature);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }),
        ),
      ),
    );
  }
}
