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
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_book),
            onPressed: () {
              Get.toNamed(Routes.ADD_LITERATUR);
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
          child: StreamBuilder<List<UploadedLiterature>>(
            stream: controller.uploadedLiteraturesStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error fetching data');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No data available'));
              } else {
                final uploadedLiteratures = snapshot.data!;
                return ListView.builder(
                  itemCount: uploadedLiteratures.length,
                  itemBuilder: (context, index) {
                    final literature = uploadedLiteratures[index];
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
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              literature.name,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
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
                                  onTap: () {},
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
                                    literature.isPlaying
                                        ? literature.stopAudio()
                                        : literature.playAudio();
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
            },
          ),
        ),
      ),
    );
  }
}
